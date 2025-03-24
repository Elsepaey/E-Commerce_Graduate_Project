import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:graduate_project/constants.dart';
import 'package:graduate_project/screens/cache/cache_helper.dart';
import 'package:graduate_project/screens/login_page.dart';
import 'package:graduate_project/widgets/custom_button.dart';
import 'package:graduate_project/widgets/custom_hintfield.dart';
import 'package:graduate_project/widgets/custom_textfield.dart';
import 'package:graduate_project/widgets/short_textfield.dart';
import 'validator.dart/validator.dart';

// add the import statement
import 'package:fluttertoast/fluttertoast.dart';

const primaryColor = Color(0xff2E5B41);
const whiteColor = Colors.white;

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailConttroller = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  String? _selectedGender = 'M';
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    firstName.dispose();
    lastName.dispose();
    _dobController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    emailConttroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              Spacer(flex: 1),
              Text(
                'Sign up',
                style: TextStyle(
                  fontSize: 24,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(flex: 1),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('First Name'),
                        SizedBox(height: 5),
                        SizedBox(
                          height: 80,
                          child: ShortTextfield(
                            controller: firstName,
                            keyboardType: TextInputType.name,
                            validator: (value) =>
                                Validator.displayNamevalidator(value),
                          ),
                        ),
                        Text('Date Of Birth'),
                        SizedBox(height: 5),
                        CustomHintfield(
                          hinttext: 'YYYY-MM-DD',
                          suffixIcon: IconButton(
                            icon: Icon(Icons.calendar_today),
                            onPressed: () async {
                              DateTime? selectedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime.now(),
                              );

                              if (selectedDate != null) {
                                String formattedDate =
                                    "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}";
                                _dobController.text =
                                    formattedDate; // Set the selected date in the field
                              }
                            },
                          ),
                          controller: _dobController,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Last Name'),
                        SizedBox(height: 5),
                        SizedBox(
                          height: 80,
                          child: ShortTextfield(
                            controller: lastName,
                            keyboardType: TextInputType.name,
                            validator: (value) =>
                                Validator.displayNamevalidator(value),
                          ),
                        ),
                        Text('Gender'),
                        SizedBox(height: 5),
                        DropdownButtonFormField<String>(
                          value: _selectedGender,
                          decoration: InputDecoration(
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
                          ),
                          items: [
                            DropdownMenuItem(
                              child: Text('M'),
                              value: 'M',
                            ),
                            DropdownMenuItem(
                              child: Text('F'),
                              value: 'F',
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              _selectedGender = value;
                            });
                          },
                          icon: Icon(Icons.arrow_drop_down), // Down arrow icon
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                'Phone',
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(height: 5),
              CustomTextfield(
                hinttext: 'Phone Number',
                controller: phoneController,
                inputType: TextInputType.phone,
                validator: (value) => Validator.validatePhone(value),
              ),
              SizedBox(height: 10),
              Text(
                'Email',
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(height: 5),
              CustomTextfield(
                hinttext: 'Example@email.com',
                controller: emailConttroller,
                inputType: TextInputType.emailAddress,
                validator: (value) => Validator.emailValidator(value),
              ),
              SizedBox(height: 10),
              Text(
                'Password',
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(height: 5),
              CustomTextfield(
                  hinttext: 'At least 8 characters',
                  controller: passwordController,
                  inputType: TextInputType.visiblePassword,
                  validator: (value) => Validator.passwordValidator(value)),
              SizedBox(height: 10),
              Text(
                'Confirm Password',
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(height: 5),
              CustomTextfield(
                hinttext: 'Confirm Password',
                controller: confirmPasswordController,
                inputType: TextInputType.visiblePassword,
                validator: (value) => Validator.repeatPasswordValidator(
                  value: value,
                  password: passwordController.text,
                ),
              ),
              SizedBox(height: 10),
              CustomButton(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    regis();
                  }
                },
                title: 'Sign Up',
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already Have an account?',
                    style: TextStyle(color: Colors.black),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'LoginPage');
                    },
                    child: Text(
                      '  Login',
                      style: TextStyle(color: Colors.green[900]),
                    ),
                  ),
                ],
              ),
              Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }

  void regis() async {
    try {
      final Dio dio = Dio();
      final response = await dio
          .post('https://mohamednowar.pythonanywhere.com/api/register/', data: {
        "first_name": firstName.text,
        "last_name": lastName.text,
        "date_of_birth": _dobController.text,
        "username": firstName.text,
        "email": emailConttroller.text,
        "password": passwordController.text,
        "confirm_password": confirmPasswordController.text,
        "phone_number": phoneController.text,
        "gender": _selectedGender,
      });

      if (response.statusCode == 201 || response.statusCode == 200) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ),
        );
      }
    } on DioException catch (e) {
      showToast(msg: 'Please check the entered data..');
      debugPrint('my error is ${e.response}');
    }
  }
}

void showToast({
  required String msg,
  ToastGravity gravity = ToastGravity.TOP,
  Toast toastLength = Toast.LENGTH_LONG,
}) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: toastLength,
    gravity: gravity,
    timeInSecForIosWeb: 5,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}


