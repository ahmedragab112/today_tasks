import 'package:flutter/material.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled(
      {super.key,
      required this.hintText,
      required this.type,
      required this.inputType,
      required this.controller, this.maxLines=1});
  final String hintText;
  final String type;
final int maxLines;
  final TextEditingController controller;
  final TextInputType inputType;
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines:maxLines ,
      controller: controller,
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
