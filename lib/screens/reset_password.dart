import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:graduate_project/constants.dart';
import 'package:graduate_project/screens/shop_screen.dart';
import 'package:graduate_project/screens/signup_screen.dart';
import 'package:graduate_project/screens/cache/cache_helper.dart';
import 'package:graduate_project/widgets/custom_button.dart';
import 'package:graduate_project/widgets/custom_textfield.dart';
import 'validator.dart/validator.dart';

class ResetPassword extends StatefulWidget {
  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final TextEditingController newpasswordController = TextEditingController();

  final GlobalKey<FormState> formKey =
      GlobalKey<FormState>(); // Form key for validation

  @override
  void dispose() {
    emailController.dispose();
    codeController.dispose();
    newpasswordController.dispose();
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
              Text('Reset Password',
                  style: TextStyle(
                      fontSize: 24,
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 50),
              Text(' Your Email:', style: TextStyle(color: Colors.black)),
              SizedBox(height: 5),
              CustomTextfield(
                hinttext: ' Enter your email',
                 controller:emailController ,
                inputType: TextInputType.emailAddress,
                validator: (value) => Validator.emailValidator(value),
              ),
              
              SizedBox(height: 30),
              Text(' Code:', style: TextStyle(color: Colors.black)),
              SizedBox(height: 5),
              CustomTextfield(
                hinttext: '43089',
                controller: codeController,
                inputType: TextInputType.phone,
                validator: (value) => Validator.validatePhone(value),
              ),
              SizedBox(height: 30),
              Text(' New Password', style: TextStyle(color: Colors.black)),
              SizedBox(height: 5),
              CustomTextfield(
                hinttext: 'Enter New Password',
                controller: newpasswordController,
                inputType: TextInputType.visiblePassword,
                validator: (value) => Validator.passwordValidator(value),
              ),
              SizedBox(height: 50),
              CustomButton(
                onTap: () {},
                title: 'Submit', // Corrected button title
              ),
              SizedBox(height: 50),
              Spacer(flex: 2),
        ],
        
          ),
        ),
      ),
    );
  }
 }




