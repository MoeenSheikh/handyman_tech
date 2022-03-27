import 'package:flutter/material.dart';
import 'package:handyman_tech/constants/constants_colors.dart';



class ComponentButton {
  static Widget buildButton({
    String title = '',
    Function onPressed,
    double height = 50.0,
    double width = 200.0,
    Color btnColor = ConstantColor.primaryColorDark,
    Color texColor = Colors.white,
    Color borderColor =ConstantColor.primaryColorDark,
    double radius = 60.0,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: btnColor,
          border: Border.all(color: borderColor, width: 2.0),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            title.toUpperCase(),
            style: TextStyle(
                color: texColor,
                fontWeight: FontWeight.bold,
                fontSize: 14),
          ),
        ),
      ),
    );
  }

  static Widget buildTransparentButton({
    String title,
    Function onPressed,
    double height = 44.0,
    double width = 140.0,
    Color btnColor = Colors.transparent,
    Color texColor = Colors.black,
    Color borderColor = Colors.grey,
    double radius = 38.0,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: btnColor,
          border: Border.all(color: borderColor.withOpacity(0.3), width: 2.0),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            title.toUpperCase(),
            style: TextStyle(color: texColor, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
