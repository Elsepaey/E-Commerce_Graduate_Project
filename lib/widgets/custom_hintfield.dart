 import 'package:flutter/material.dart';
class CustomHintfield extends StatelessWidget {
  final String hinttext;
  final Widget? suffixIcon;
  final TextEditingController? controller;

  CustomHintfield({required this.hinttext, this.suffixIcon, this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      height: 53,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hinttext, // Set the hint text here
          hintStyle:
              TextStyle(color: Colors.grey), // Set hint text color to gray
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: const Color.fromARGB(255, 45, 88, 47),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: const Color.fromARGB(255, 45, 88, 47),
            ),
          ),
          suffixIcon: suffixIcon, // Add suffix icon
        ),
      ),
    );
  }
}


