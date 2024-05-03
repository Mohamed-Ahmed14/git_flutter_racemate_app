import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final Color borderColor;
  final String? label;
  final Color? labelColor;
  final String? hint;
  final Color? hintColor;
  final bool filled;
  final Color? filledColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool enabled;
  final bool readOnly;
  final bool showCursor;
  final Color? cursorColor;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  final TextInputType? keyboardType;
  final FloatingLabelBehavior floatingLabelBehavior;


  const CustomTextFormField({
    this.floatingLabelBehavior = FloatingLabelBehavior.always,
    this.keyboardType,
    this.onTap,
    this.filledColor,
    this.filled = false,
    this.validator,
    this.controller,
    this.obscureText = false,
    this.showCursor = true,this.cursorColor,
    this.enabled= true,this.readOnly = false,
    this.prefixIcon,this.suffixIcon,
    this.hint = "",this.hintColor,
    this.label="",this.labelColor,
    required this.borderColor,
    super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
              color: borderColor,
              width: 2
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
              color: borderColor,
              width: 2
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
              color: borderColor,
              width: 2
          ),
        ),

        labelText: label,
        labelStyle: TextStyle(
          color: labelColor,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        floatingLabelBehavior: floatingLabelBehavior,
        alignLabelWithHint: true,

        hintText: hint,
        hintStyle: TextStyle(
          color: hintColor,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),

        filled: filled,
        fillColor: filledColor,

        contentPadding: EdgeInsets.all(8),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        enabled: enabled,
      ),
      style: TextStyle(
          fontSize: 16
      ),

      readOnly: readOnly,
      showCursor: showCursor,
      cursorColor: cursorColor,
      obscureText: obscureText,
      controller: controller,
      validator: validator,
      onTap: onTap,
      keyboardType: keyboardType,
    );
  }
}
