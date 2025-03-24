 import 'package:flutter/material.dart';
 import 'package:graduate_project/constants.dart';

class CustomTextfieldCheckout extends StatelessWidget {
CustomTextfieldCheckout({super.key});

  @override
  Widget build(BuildContext context) {
     return SizedBox(
        width: 120,
        height: 53,
        child: TextField(
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
                color: kPrimaryColor, width: 2),
                  ))),
        );
  }
}





