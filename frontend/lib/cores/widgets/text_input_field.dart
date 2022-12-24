import 'package:flutter/material.dart';
import 'package:frontend/cores/const/const.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final TextInputType textInputType;

  const TextFieldInput({
    Key? key,
    required this.hintText,
    this.isPass = false,
    required this.textEditingController,
    required this.textInputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return TextField(
      controller: textEditingController,
      autocorrect: false,
      enableSuggestions: false,
      style: const TextStyle(
          color: Color(0xFF1F1F1F),
          fontSize: 14,
          fontWeight: FontWeight.w500,
          fontFamily: AppFonts.mainFont),
      decoration: InputDecoration(
        hintStyle: const TextStyle(
            color: Color(0xFFB4B4B4),
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontFamily: AppFonts.mainFont),
        fillColor: Colors.white,
        hintText: hintText,
        // border: InputBorder,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        filled: true,
        contentPadding: const EdgeInsets.all(8),
      ),
      keyboardType: textInputType,
      obscureText: isPass,
    );
  }
}
