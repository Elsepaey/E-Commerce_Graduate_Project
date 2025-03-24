import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:graduate_project/constants.dart';
import 'package:graduate_project/screens/shop_screen.dart';
import 'package:graduate_project/screens/signup_screen.dart';
import 'package:graduate_project/screens/cache/cache_helper.dart';
import 'package:graduate_project/widgets/custom_button.dart';
import 'package:graduate_project/widgets/custom_textfield.dart';
import 'validator.dart/validator.dart';

class VerifyCode extends StatefulWidget {
  @override
  State<VerifyCode> createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController verificationcodeController =
      TextEditingController();
  final GlobalKey<FormState> formKey =
      GlobalKey<FormState>(); // Form key for validation

  @override
  void dispose() {
    emailController.dispose();
    verificationcodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(flex: 1),
              Text('Verify Your Code',
                  style: TextStyle(
                      fontSize: 24,
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 50),
              Text(' Your Email:', style: TextStyle(color: Colors.black)),
              SizedBox(height: 5),
              CustomTextfield(
                hinttext: ' Enter your email',
                 controller: verificationcodeController,
                  inputType: TextInputType.emailAddress,
                 validator: (value) => Validator.emailValidator(value),
              ),
              SizedBox(height: 30),
              Text('Enter Verification Code:',
                  style: TextStyle(color: Colors.black)),
              SizedBox(height: 5),
              CustomTextfield(
                hinttext: 'Enter Code',
                controller: verificationcodeController,
                  inputType: TextInputType.phone,
                validator: (value) =>  Validator.validatePhone(value)
              ),
              SizedBox(height: 50),
              CustomButton(
               
                onTap: () {},
                title: 'Verify Code', // Corrected button title
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t recieve the code?',
                      style: TextStyle(color: Colors.black)),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'Reset Password');
                    },
                    child:
                        Text('Resend', style: TextStyle(color: kPrimaryColor)),
                  ),
                ],
              ),
              Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
 }


