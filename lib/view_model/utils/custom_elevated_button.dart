import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final void Function() onPressed;
  final Widget child;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double width;
  final double height;
  final double padding;
  final Color borderColor;
  final double borderRadius;
  const CustomElevatedButton({super.key,
    required this.borderRadius,
    required this.borderColor,
    this.padding = 10,
    this.width = 320,
    this.height = 50,
    this.backgroundColor,
    this.foregroundColor,
    required this.child,
    required this.onPressed,});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: child,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        fixedSize: Size(width, height),
        padding: EdgeInsets.all(padding),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: borderColor,
          ),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}
