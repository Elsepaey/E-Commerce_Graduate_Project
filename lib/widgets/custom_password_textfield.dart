import 'package:flutter/material.dart';

class CustomPasswordTextfield extends StatelessWidget {
  CustomPasswordTextfield({required this.hinttext,
      required this.controller,
      this.inputType,
      this.validator});
  String hinttext;
final TextEditingController controller;
  final TextInputType? inputType;
  final String? Function(String?)? validator;
  // final TextEditingController currentPasswordController =
  //     TextEditingController();
  // final TextEditingController newPasswordController = TextEditingController();
  // final TextEditingController confirmPasswordController =
  //     TextEditingController();
  Widget build(BuildContext context) {
    return TextField(
      // controller: currentPasswordController,
      obscureText: true,
      decoration: InputDecoration(
          hintText: hinttext,
           hintStyle: TextStyle(color: const Color.fromARGB(255, 174, 165, 165),),
        // labelText: 'Your Password',
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: const Color.fromARGB(255, 45, 88, 47),
            //dont click
          ),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: const Color.fromARGB(255, 45, 88, 47),
            )),
      ),
    );
  }
}
 

