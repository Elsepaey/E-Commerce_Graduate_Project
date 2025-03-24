import 'package:flutter/material.dart';
import 'package:graduate_project/constants.dart';

class CustomTextfield extends StatefulWidget {
  CustomTextfield({required this.hinttext, required this.controller, this.inputType, this.validator});
  String? hinttext;
  final TextEditingController controller;
  final  TextInputType? inputType;
  final String? Function(String?)? validator;

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: widget.controller,
        keyboardType:  widget.inputType,
        validator:widget.validator ,
        decoration: InputDecoration(
            hintText: widget.hinttext,
            
            hintStyle:
                TextStyle(color: const Color.fromARGB(255, 174, 165, 165)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: const Color.fromARGB(255, 45, 88, 47),
                //dont click
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: kPrimaryColor, width: 2),
            )));
  }
}
