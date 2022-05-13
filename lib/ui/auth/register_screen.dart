

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:handyman_tech/components/component_button.dart';
import 'package:handyman_tech/components/component_form_fields.dart';

import 'package:handyman_tech/components/component_sized_box.dart';
import 'package:handyman_tech/components/component_text_widgets.dart';

import 'package:handyman_tech/constants/const_dimensions.dart';
import 'package:handyman_tech/constants/constants_colors.dart';
import 'package:handyman_tech/constants/constants_strings.dart';
import 'package:handyman_tech/models/user_model.dart';
import 'package:handyman_tech/ui/auth/auth_bloc/auth_bloc.dart';
import 'package:handyman_tech/ui/auth/auth_bloc/auth_event.dart';
import 'package:handyman_tech/ui/auth/auth_bloc/auth_state.dart';
import 'package:handyman_tech/ui/auth/login_screen.dart';
import 'package:get/get.dart';
import 'package:handyman_tech/ui/auth/verificationcode_screen.dart';
// import 'package:handyman_client/ui/home/home_screen.dart';
// import 'package:handyman_client/ui/home/homeservice_screen.dart';

class RegisterScreen extends StatefulWidget {
  String phoneNumber;
  RegisterScreen({this.phoneNumber});
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AuthBloc _authBloc=AuthBloc();
  int _value = 1;
  String lastName;
  String firstName;

  String gender="Male";
  String email;
  List<String> _country = [
    'Male',
    'Female',
    'Other',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColor.APP_COLOR,
      appBar: AppBar(
        elevation: 0.0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () {
                //Scaffold.of(context).openDrawer();
                Get.back();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        backgroundColor: ConstantColor.APP_COLOR,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: BlocListener(
              bloc: _authBloc,
              listener: (BuildContext context, state) {  },
              child: BlocBuilder(
                bloc: _authBloc,
                builder: (context, AuthState state){
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ComponentSizedBox.topMargin(size: Dimension.Size_10),
                    ComponentText.buildTextWidget(
                        title: 'Personel Details',
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    ComponentSizedBox.topMargin(size: Dimension.Size_10),
                    ComponentText.buildTextWidget(
                        title: 'Please add information to complete Signup',
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.normal),
                    ComponentSizedBox.topMargin(size: 50),
                    Row(
                      children: [
                        Expanded(
                          child: FormFieldComponent.formFieldWithoutIcon(
                            hint: ConstantString.FirstName,
                            onChange: (value){
                              setState(() {
                                firstName=value;

                              });
                            }
                          ),
                        ),
                        ComponentSizedBox.sideMargin(size: 20.0),
                        Expanded(
                          child: FormFieldComponent.formFieldWithoutIcon(
                            hint: ConstantString.LastName,
                            onChange: (value){
                              setState(() {
                                lastName=value;
                              });
                            }
                          ),
                        ),
                      ],
                    ),

                    /*FormFieldComponent.RoundedformField(
                        hint: ConstantString.FirstName),
                    ComponentSizedBox.topMargin(size: Dimension.Size_10),
                    FormFieldComponent.RoundedformField(
                        hint: ConstantString.LastName),*/
                    ComponentSizedBox.topMargin(size: 40),
                    FormFieldComponent.formFieldWithoutIcon(hint: 'Email Address',
                    onChange: (value){
                      setState(() {
                        email=value;
                      });
                    }),
                    ComponentSizedBox.topMargin(size: 40),



                    /*Row(
                      children: <Widget>[
                        Radio(value: 1, groupValue: 1, onChanged: (value) {}),
                        ComponentText.buildTextWidget(
                            title: 'I\'am a non bussiness entity'),
                      ],
                    ),*/
                      ComponentText.buildTextWidget(
                        title: 'Gender',
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    Row(
                      children: [
                        buildbuyingPriceContainer(title: 'Male', radiovalue: 1),
                        buildbuyingPriceContainer(title: 'Female ', radiovalue: 2),
                        buildbuyingPriceContainer(title: 'Other ', radiovalue: 3),
                      ],
                    ),
                    ComponentSizedBox.topMargin(size: Dimension.Size_50),
                    ComponentButton.buildButton(
                      title: 'Done',
                      onPressed: () {
                        // Get.to(VerificationCodeScreen());
                        final formState = formKey.currentState;
                        if (formState.validate()) {
                          formState.save();


                          UserModel user=UserModel(firstName: firstName,lastName: lastName,phoneNumber: widget.phoneNumber,email: email,gender: gender);

                          _authBloc.add(AddUserEvent(user: user));
                          //Get.to(HomeServiceScreen(userModel: user,));
                        }
                      },
                      width: MediaQuery.of(context).size.width,
                    ),
                  ],
                );
  }
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container buildbuyingPriceContainer({String title, int radiovalue}) {
    return Container(
      height: 50,
      child: Row(
        children: [
          Radio(
              value: radiovalue,
              groupValue: _value,
              onChanged: (value) {
                _value = value;
                setState(() {

                  gender=title;
                  print(gender);
                });
              }),
          ComponentSizedBox.sideMargin(size: 10),
          ComponentText.buildTextWidget(
              title: title, fontSize: 16, color: Colors.white)
        ],
      ),
    );
  }
}
