import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:handyman_tech/components/component_button.dart';
import 'package:handyman_tech/components/component_form_fields.dart';
import 'package:handyman_tech/components/component_password_form_field.dart';
import 'package:handyman_tech/components/component_sized_box.dart';
import 'package:handyman_tech/components/component_text_widgets.dart';
import 'package:handyman_tech/constants/const_dimensions.dart';
import 'package:handyman_tech/constants/constants_colors.dart';
import 'package:handyman_tech/constants/constants_strings.dart';
import 'package:handyman_tech/ui/auth/register_screen.dart';
import 'package:handyman_tech/ui/auth/verificationcode_screen.dart';
//import 'package:handyman_tech/ui/screens/home/home_screen.dart';


class LoginScreen extends StatefulWidget {
  static const id = "LoginScreen";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String phoneNumber="";

  @override
  Widget build(BuildContext context) {
    //SizeConfig.init(context);
    return Scaffold(
      backgroundColor: ConstantColor.APP_COLOR,
      /*   appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        centerTitle: false,
        title: ComponentText.buildTextWidget(
          title: ConstantString.SignIn,
          color: ConstantColor.black,
          fontSize: Dimension.Size_20,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.white,
      ), */
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(top: 60.0, left: 24.0, right: 24.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: ComponentText.buildTextWidget(
                        title: 'Welcome to HandyMan\n Technician',
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.white,textAlign: TextAlign.center),
                  ),
                  ComponentSizedBox.topMargin(size: 80),
                  ComponentText.buildTextWidget(
                      title: 'Please enter your phone number to continue',
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      color: Colors.grey,
                      textAlign: TextAlign.start),
                       ComponentSizedBox.topMargin(size: 20),
                  FormFieldComponent.buildPhoneformFieldWithoutIcon(
                    hint: 'Phone Number',
                    onChange: (value){
                      setState(() {
                        phoneNumber=value;
                      });
                    }
                  ),
                  ComponentSizedBox.topMargin(size: Dimension.Size_30),
                  /* ComponentPasswordFormField(
                    hint: 'Password',
                    fontsize: Dimension.Size_14,
                  ),  */
                  ComponentSizedBox.topMargin(size: Dimension.Size_30),
                  ComponentButton.buildButton(
                    title: 'Conitune',
                    onPressed: () {
                      //login();
                       final formState = formKey.currentState;
                      if (formState.validate()) {
                        formState.save();
                        Navigator.push(context, MaterialPageRoute(builder: (context) => VerificationCodeScreen(name: phoneNumber,)));

                        //Get.to(VerificationCodeScreen(name: phoneNumber,));
                      } 
                    },
                    width: MediaQuery.of(context).size.width,
                  ),
                  ComponentSizedBox.topMargin(size: Dimension.Size_20),
                 /*  ComponentText.buildTextWidget(
                    title: ConstantString.ForgotPassword,
                    color: Colors.grey,
                    textDecoration: TextDecoration.underline,
                  ),
                  ComponentSizedBox.topMargin(size: Dimension.Size_20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ComponentText.buildTextWidget(
                          title: ConstantString.DoNotHaveAnAccount,
                          color: Colors.grey),
                      InkWell(
                        onTap: () async {
                          Get.to(RegisterScreen());
                        },
                        child: ComponentText.buildTextWidget(
                            title: ConstantString.Register,
                            color: Colors.redAccent),
                      ),
                    ],
                  ), */
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
