import 'package:flutter/material.dart';
import 'package:graduate_project/constants.dart';

class CustomTextfieldCheckout extends StatefulWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? hintText;

  const CustomTextfieldCheckout({
    super.key,
    this.controller,
    this.validator,
    this.hintText,
  });

  @override
  State<CustomTextfieldCheckout> createState() => _CustomTextfieldCheckoutState();
}

class _CustomTextfieldCheckoutState extends State<CustomTextfieldCheckout> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 53,
      child: TextFormField(
        focusNode: _focusNode,
        controller: widget.controller,
        validator: widget.validator,
        decoration: InputDecoration(
          hintText: widget.hintText,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 45, 88, 47),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: kPrimaryColor,
              width: 2,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 2,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}