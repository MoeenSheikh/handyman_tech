import 'package:flutter/material.dart';

import 'package:handyman_tech/constants/constants_colors.dart';


class ComponentPasswordFormField extends StatefulWidget {
  String hint;

  IconData iconField;
  IconData suffixIcon;
  Function onChange;
  Function validator;
  Function onSaved;
  Function onPasswordPressed;
  //isObscure = false;
  Function onSubmitted;
  TextInputType keyboardType = TextInputType.text;
  //bool autoValidate = false;
  double fontsize = 14;
  Color dividercolor = Colors.red;

  ComponentPasswordFormField(
      {this.hint,
      this.iconField,
      this.onChange,
      this.validator,
      this.onSaved,
      this.onPasswordPressed,
      this.onSubmitted,
      this.keyboardType,

      //this.autoValidate,
      this.fontsize,
      this.dividercolor,
      this.suffixIcon});

  @override
  _ComponentPasswordFormFieldState createState() =>
      _ComponentPasswordFormFieldState();
}

class _ComponentPasswordFormFieldState
    extends State<ComponentPasswordFormField> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Theme(
        data: ThemeData(
          primaryColor: ConstantColor.APP_COLOR,
          hintColor: Colors.grey,
          //dividerColor: dividerco,
        ),
        child: TextFormField(
          cursorColor: ConstantColor.primaryColor,
          obscureText: isVisible ? false : true,
          //autovalidate: widget.autoValidate,
          textAlign: TextAlign.start,
          decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color:ConstantColor.primaryColor),
                   ),  
         
            //hintTextDirection: TextDirection.ltr,
            /*   prefixIcon: Icon(
              iconField,
              color: ConstantColor.APP_COLOR,
            ), */
            suffixIcon: IconButton(
              icon: isVisible
                  ? Icon(Icons.visibility,color: ConstantColor.primaryColor,)
                  : Icon(Icons.visibility_off,color: ConstantColor.primaryColor),
              onPressed: () {
                setState(() {
                  isVisible = !isVisible;
                });
              },
            ),
            hintText: widget.hint,
            labelStyle: TextStyle(color: Colors.black),
            hintStyle: TextStyle(
              fontSize: widget.fontsize,
            ),
          ),
          onChanged: widget.onChange,
          onFieldSubmitted: widget.onSubmitted,
          validator: (value) {
            //return Validation.validateValue(value, widget.hint, false);
          },
          onSaved: widget.onSaved,
          keyboardType: widget.keyboardType,
        ),
      ),
    );
  }
}
