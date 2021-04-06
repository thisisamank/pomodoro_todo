import 'package:flutter/material.dart';
import 'package:pomodoro_todo/constants/colors.dart';

class Button extends StatelessWidget {
  final Function onPressed;
  final title;
  final width;
  final height;
  final Color color;
  final Color textColor;
  Button({
    @required this.onPressed,
    @required this.title,
    final color,
    final double height,
    final textColor,
    final double width,
  })  : this.color = color ?? BrandColors.blue,
        this.height = height ?? 30.0,
        this.width = width ?? 50.0,
        this.textColor = textColor ?? BrandColors.primaryText;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      onPressed: onPressed,
      minWidth: width,
      height: height,
      color: color,
      textColor: textColor,
      child: Text(title),
    );
  }
}
