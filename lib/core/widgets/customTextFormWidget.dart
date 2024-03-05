import 'package:flutter/material.dart';

class CustomTextFormWidget extends StatelessWidget {
  const CustomTextFormWidget(
      {super.key,
      required this.hintText,
      required this.validator,
      required this.textEditingController,
      required this.obSecureText});
  final String hintText;
  final TextEditingController textEditingController;
  final bool obSecureText;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: textEditingController,
      decoration:
          InputDecoration(hintText: hintText, border: OutlineInputBorder()),
      obscureText: obSecureText,
    );
  }
}
