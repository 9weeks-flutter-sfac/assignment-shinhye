import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? textEditingController;
  final String? hintText;
  final bool obscureText;
  final int? maxLines;
  final int? maxLength;

  const CustomTextField({
    this.textEditingController,
    this.hintText,
    this.obscureText = false,
    this.maxLines,
    this.maxLength,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
      maxLines: obscureText ? 1 : maxLines,
      maxLength: maxLength,
    );
  }
}
