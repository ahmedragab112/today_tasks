import 'package:flutter/material.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled(
      {super.key,
      required this.hintText,
      required this.type,
      required this.inputType,
      this.maxLines = 1,
      this.onSaved});
  final String hintText;
  final String type;
  final int maxLines;
  final void Function(String?)? onSaved;
  final TextInputType inputType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'the filed is required';
        } else {
          return null;
        }
      },
      style: const TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(20),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.blue,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          label: Text(
            type,
            style: const TextStyle(color: Colors.white),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white)),
      keyboardType: inputType,
    );
  }
}
