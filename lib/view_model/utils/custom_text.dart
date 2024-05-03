import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? letterSpacing;
  final int? maxLines;
  final TextOverflow? textOverflow;


  const CustomText({required this.text,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.letterSpacing,
    this.maxLines,
    this.textOverflow,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        overflow: textOverflow,
      ),
      maxLines: maxLines,
    );
  }
}
