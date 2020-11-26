import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  
  final String text;
  final double textSize;
  final Color textColor;

  CustomText(this.text, this.textSize, this.textColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: textSize, color: textColor),
      ),
    );
  }
}