import 'package:flutter/material.dart';
import 'package:notes_app_creativa/style/app_colors.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.maxLines = 3,
  });

  final TextEditingController controller;
  final String hintText;
  final int maxLines;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: 1,
      validator: (value) {
        if (value==null || value.trim().isEmpty) {
          return "Req";
        }
        return null;
      },
      maxLines: widget.maxLines,
      controller: widget.controller,
      decoration: InputDecoration(
        hintText:widget.hintText,
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.red
          )
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.red
          )
        ),
      ),
    );
  }
}