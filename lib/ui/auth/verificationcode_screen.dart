import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:handyman_tech/components/component_button.dart';

import 'package:handyman_tech/components/component_sized_box.dart';
import 'package:handyman_tech/components/component_text_widgets.dart';
import 'package:handyman_tech/constants/constants_colors.dart';
import 'package:handyman_tech/ui/auth/register_screen.dart';
import 'package:handyman_tech/ui/complete_profile/area_screen.dart';
//import 'package:handyman_client/ui/screens/home/home_screen.dart';

class VerificationCodeScreen extends StatefulWidget {
  String name;
  String id;
  VerificationCodeScreen({this.name, this.id});
  @override
  _State createState() => _State();
}

class _State extends State<VerificationCodeScreen> {
  Timer _timer;
  int _startTime = 30;
  String timeToShow = "30";
  String _verificationCode;
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
   loginUser() async{
     print(widget.name);
    var res=await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: widget.name,
        verificationCompleted: (PhoneAuthCredential credential) async {
          print("verification completed");
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => AreaScreen()),
                      (route) => false);
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print("verification failed"+e.message);
        },
        codeSent: (String verficationID, int resendToken) {
          print("code sent "+verficationID);
          setState(() {
            _verificationCode = verficationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          print("auto retrieved");
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: Duration(seconds: 120));


  }
  @override
  void initState() {
    super.initState();
    loginUser();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    //print(widget.name);
    return Scaffold(
      appBar: AppBar(
        elevation:0.0,
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {
              //Scaffold.of(context).openDrawer();
              //Get.back();
            }),
        backgroundColor: ConstantColor.APP_COLOR,
        title: ComponentText.buildTextWidget(
            title: '',
            color: Colors.black,
            fontSize: 18.0,
            fontWeight: FontWeight.bold),
      ),
        backgroundColor: ConstantColor.APP_COLOR,
      body: 
            SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(top: 40.0),
                child: Column(
                  children: [
                    ComponentSizedBox.topMargin(size: 0.0),

                    ComponentText.buildTextWidget(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        title:'OTP Verification',
                        color: Colors.white),
                    ComponentSizedBox.topMargin(size: 16.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60),
                      child: ComponentText.buildTextWidget(
                          fontSize: 18.0,
                          color: Colors.grey,
                          maxLines: 2,
                          title: 'Enter 6 digit number that sent to mobile number and email address',textAlign: TextAlign.center),
                    ),
           
                    ComponentSizedBox.topMargin(size: 60.0),
                    OTPVerificationWidget(
                      onSubmit: (String pin) async{
                        try {
                          await FirebaseAuth.instance
                              .signInWithCredential(PhoneAuthProvider.credential(
                              verificationId: _verificationCode, smsCode: pin))
                              .then((value) async {
                            if (value.user != null) {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(builder: (context) => AreaScreen()),
                                      (route) => false);
                            }
                          });
                        } catch (e) {
                          FocusScope.of(context).unfocus();
                          SnackBar(content: Text('invalid OTP'));
                          setState(() {

                          });
                        }
                      },
                    ),
                    ComponentSizedBox.topMargin(size: 40.0),
                      ComponentText.buildTextWidget(
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                        title:'Resend verifiction code in $timeToShow sec',
                        color: Colors.red),
                        ComponentSizedBox.topMargin(size: 50.0),
                        ComponentButton.buildButton(title: 'Verify',onPressed: (){
                         //Get.to(()=>  RegisterScreen());
                        })
                  ],
                ),
              ),
            ), 
         
      
    );
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer =  Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_startTime == 0) {
          setState(() {
            timeToShow = "00";
            timer.cancel();
          });
        } else {
          setState(() {
            _startTime--;
            if (_startTime <= 9) {
              timeToShow = "0" + _startTime.toString();
            } else
              timeToShow = _startTime.toString();
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}

class OTPVerificationWidget extends StatefulWidget {
  final String lastPin;
  final int fields;
  final ValueChanged<String> onSubmit;
  final num fieldWidth;
  final num fontSize;
  final bool isTextObscure;
  final bool showFieldAsBox;
  final cursorColor; // Leaving the data type dynamic for adding Color or Material Color
  final boxColor;
  final textColor;

  OTPVerificationWidget({
    this.lastPin,
    this.fields= 6,
    this.onSubmit,
    this.fieldWidth= 40.0,
    this.fontSize= 16.0,
    this.isTextObscure= false,
    this.showFieldAsBox= false,
    this.cursorColor= ConstantColor.primaryColor
        , // Adding a Material Color so that if the user want black, it get accepted too
    this.boxColor= ConstantColor.primaryColor,
    this.textColor= ConstantColor.primaryColor,
  }) : assert(fields > 0);

  @override
  State createState() {
    return OTPVerificationWidgetState();
  }
}

class OTPVerificationWidgetState extends State<OTPVerificationWidget> {
  List<String> _pin;
  List<FocusNode> _focusNodes;
  List<TextEditingController> _textControllers;

  Widget textFields = Container();

  @override
  void initState() {
    super.initState();
    _pin = List<String>(widget.fields);
    _focusNodes = List<FocusNode>(widget.fields);
    _textControllers = List<TextEditingController>(widget.fields);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        if (widget.lastPin != null) {
          for (var i = 0; i < widget.lastPin.length; i++) {
            _pin[i] = widget.lastPin[i];
          }
        }
        textFields = generateTextFields(context);
      });
    });
  }

  @override
  void dispose() {
    _textControllers.forEach((TextEditingController t) => t.dispose());
    super.dispose();
  }

  Widget generateTextFields(BuildContext context) {
    List<Widget> textFields = List.generate(widget.fields, (int i) {
      return buildTextField(i, context, i == 0);
    });

    if (_pin.first != null) {
      FocusScope.of(context).requestFocus(_focusNodes[0]);
    }

    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        verticalDirection: VerticalDirection.down,
        children: textFields);
  }

  void clearTextFields() {
    _textControllers.forEach(
        (TextEditingController tEditController) => tEditController.clear());
    _pin.clear();
  }

  Widget buildTextField(int i, BuildContext context, [bool autofocus = false]) {
    if (_focusNodes[i] == null) {
      _focusNodes[i] = FocusNode();
    }
    if (_textControllers[i] == null) {
      _textControllers[i] = TextEditingController();
      if (widget.lastPin != null) {
        _textControllers[i].text = widget.lastPin[i];
      }
    }

    _focusNodes[i].addListener(() {
      if (_focusNodes[i].hasFocus) {}
    });

    final String lastDigit = _textControllers[i].text;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
      child: Container(
        width: widget.fieldWidth,
        child: TextField(
          controller: _textControllers[i],
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          cursorColor: Colors.white,
          maxLength: 1,
          autofocus: autofocus,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              // color: Colors.black,
              fontSize: widget.fontSize),
          focusNode: _focusNodes[i],
          obscureText: widget.isTextObscure,
          decoration: InputDecoration(
            hintText: '-',
            hintStyle: TextStyle(color: Colors.white),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            counterText: "",
          ),
          onChanged: (String str) {
            setState(() {
              _pin[i] = str;
            });
            if (i + 1 != widget.fields) {
              _focusNodes[i].unfocus();
              if (lastDigit != null && _pin[i] == '') {
                FocusScope.of(context).requestFocus(_focusNodes[i - 1]);
              } else {
                FocusScope.of(context).requestFocus(_focusNodes[i + 1]);
              }
            } else {
              _focusNodes[i].unfocus();
              if (lastDigit != null && _pin[i] == '') {
                FocusScope.of(context).requestFocus(_focusNodes[i - 1]);
              }
            }
            if (_pin.every((String digit) => digit != null && digit != '')) {
              widget.onSubmit(_pin.join());
            }
          },
          onSubmitted: (String str) {
            if (_pin.every((String digit) => digit != null && digit != '')) {
              widget.onSubmit(_pin.join());

              debugPrint(str);
            }
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return textFields;
  }
}
