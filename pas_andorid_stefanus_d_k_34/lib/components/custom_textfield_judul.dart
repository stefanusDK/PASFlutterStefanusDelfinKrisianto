import 'package:flutter/material.dart';


class CustomTextfieldJudul extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final TextAlign textAlign;

  const CustomTextfieldJudul({
    super.key,
    required this.text,
    this.fontSize = 22,
    this.color = Colors.black,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
