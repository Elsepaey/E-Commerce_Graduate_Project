

import 'package:flutter/material.dart';
import 'package:graduate_project/constants.dart';
import 'package:graduate_project/screens/cache/cache_helper.dart';
import 'package:graduate_project/widgets/custom_button.dart';
import 'package:graduate_project/widgets/custom_password_textfield.dart';
import 'validator.dart/validator.dart';
import 'package:dio/dio.dart';

class ChangeyourPasswordScreen extends StatefulWidget {
  ChangeyourPasswordScreen({super.key});

  @override
  State<ChangeyourPasswordScreen> createState() =>
      _ChangeyourPasswordScreenState();
}

class _ChangeyourPasswordScreenState extends State<ChangeyourPasswordScreen> {
  final TextEditingController currentpasswordController =
      TextEditingController();
  final TextEditingController newpasswordController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    currentpasswordController.dispose();
    newpasswordController.dispose();
    confirmpasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        backgroundColor: kWhiteColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
         key: formKey,
          child: ListView(
            children: [
              Text(
                'Change Your Password',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 100),
              Text(
                'Your Password',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 5),
              CustomPasswordTextfield(
                hinttext: 'Your Password',
                controller: currentpasswordController,
               
              ),
              SizedBox(height: 10),
              Text(
                'New Password',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 5),
              CustomPasswordTextfield(
                hinttext: 'New Password',
                controller: newpasswordController,
                
              ),
              SizedBox(height: 10),
              Text(
                'Confirm Password',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 5),
              CustomPasswordTextfield(
                hinttext: 'Confirm Password',
                controller: confirmpasswordController,
                
              ),
              SizedBox(height: 10),
              CustomButton(
                title: 'Change Your Password',
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'ForgotYourpassword');
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(color: kPrimaryColor),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}




