import 'package:flutter/material.dart';

class ShortTextfield extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  ShortTextfield({required this.controller, this.keyboardType, this.validator});

  @override
  State<ShortTextfield> createState() => _ShortTextfieldState();
}

class _ShortTextfieldState extends State<ShortTextfield> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 160,
        height: 53,
        child: TextFormField(
          controller: widget.controller,
          keyboardType:widget.keyboardType ,
          validator:widget.validator,
          decoration: InputDecoration(
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
                  ))),
        ));
  }
}
