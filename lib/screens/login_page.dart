import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:graduate_project/constants.dart';
import 'package:graduate_project/screens/cache/cache_helper.dart';
import 'package:graduate_project/screens/shop_screen.dart';
import 'package:graduate_project/screens/signup_screen.dart';
import 'package:graduate_project/widgets/custom_button.dart';
import 'package:graduate_project/widgets/custom_textfield.dart';

import 'validator.dart/validator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey =
      GlobalKey<FormState>(); // Form key for validation

  @override
  void dispose() {
    super.dispose();
    passwordController.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const Spacer(flex: 1),
                const SizedBox(height: 50),
                const Text('Login',
                    style: TextStyle(
                        fontSize: 24,
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 50),
                const Text('Email', style: TextStyle(color: Colors.black)),
                const SizedBox(height: 5),
                CustomTextfield(
                  hinttext: 'your email',
                  controller: emailController,
                  inputType: TextInputType.emailAddress,
                  validator: (value) => Validator.emailValidator(value),
                ),
                const SizedBox(height: 30),
                const Text('Password', style: TextStyle(color: Colors.black)),
                const SizedBox(height: 5),
                CustomTextfield(
                  hinttext: 'At least 8 characters',
                  controller: passwordController,
                  inputType: TextInputType.visiblePassword,
                  validator: (value) => Validator.passwordValidator(value),
                ),
                const SizedBox(height: 50),
                CustomButton(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      login();
                    }
                  },
                  title: 'Log in', // Corrected button title
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'t have an account?',
                        style: TextStyle(color: Colors.black)),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'SignupScreen');
                      },
                      child: const Text('  Sign Up',
                          style: TextStyle(color: kPrimaryColor)),
                    ),
                  ],
                ),
                // const Spacer(flex: 2),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void login() async {
    try {
      final Dio dio = Dio();
      final response = await dio.post(
        'https://mohamednowar.pythonanywhere.com/api/login/',
        data: {
          "email": emailController.text,
          "password": passwordController.text,
        },
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        await CacheHelper.saveData(
            key: 'refreshToken', value: response.data['refresh']);
        await CacheHelper.saveData(
            key: 'accessToken', value: response.data['access']);
        await CacheHelper.saveData(
            key: 'password', value: passwordController.text);

        final accessToken = CacheHelper.getString(key: 'accessToken');
        final refreshToken = CacheHelper.getString(key: 'refreshToken');

        debugPrint('---------------------------');
        debugPrint(accessToken);
        debugPrint(refreshToken);
        debugPrint('---------------------------');

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ShopScreen(),
          ),
        );
      }
    } on DioException catch (e) {
      showToast(msg: e.response!.data["message"]);
      debugPrint('my error is ${e.response}');
    }
  }
}

//mmmm

// import 'package:dio/dio.dart';
// // import 'package:elawadytv/screens/forgotyourpassword.dart';
// // import 'package:elawadytv/screens/validator.dart';
// // import 'package:elawadytv/widget/cha.dart';
// // import 'package:elawadytv/widget/consat.dart';
// // import 'package:elawadytv/widget/custom_button.dart';
// // import 'package:elawadytv/widget/custom_textfield.dart';
// import 'package:flutter/material.dart';
// import 'package:graduate_project/constants.dart';
// import 'package:graduate_project/screens/cache/cache_helper.dart';
// import 'package:graduate_project/screens/forgot_yourpassword.dart';
// import 'package:graduate_project/screens/validator.dart/validator.dart';
// import 'package:graduate_project/widgets/custom_button.dart';
// import 'package:graduate_project/widgets/custom_textfield.dart';

// class LoginPage extends StatefulWidget {
//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final GlobalKey<FormState> formKey =
//       GlobalKey<FormState>(); // Form key for validation

//   @override
//   void dispose() {
//     super.dispose();
//     passwordController.dispose();
//     emailController.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         child: Form(
//           key: formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Spacer(flex: 1),
//               Text('Login',
//                   style: TextStyle(
//                       fontSize: 24,
//                       color: kPrimaryColor,
//                       fontWeight: FontWeight.bold)),
//               SizedBox(height: 50),
//               Text('Email', style: TextStyle(color: Colors.black)),
//               SizedBox(height: 5),
//               CustomTextfield(
//                 hinttext: 'your email',
//                 controller: emailController,
//                 inputType: TextInputType.emailAddress,
//                 validator: (value) => Validator.emailValidator(value),
//               ),
//               SizedBox(height: 30),
//               Text('Password', style: TextStyle(color: Colors.black)),
//               SizedBox(height: 5),
//               CustomTextfield(
//                 hinttext: 'At least 8 characters',
//                 controller: passwordController,
//                 inputType: TextInputType.visiblePassword,
//                 validator: (value) => Validator.passwordValidator(value),
//               ),
//               // SizedBox(height: 50),
//               GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => ForgotYourpassword()));
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       Text(
//                         "Forget Password ?",
//                         style: TextStyle(
//                             color: Colors.green.shade900,
//                             fontWeight: FontWeight.w900),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               CustomButton(
//                 onTap: () {
//                   if (formKey.currentState!.validate()) {
//                     login();
//                   }
//                 },
//                 title: 'Log in', // Corrected button title
//               ),
//               SizedBox(height: 50),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text('Don\'t have an account?',
//                       style: TextStyle(color: Colors.black)),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.pushNamed(context, 'SignupScreen');
//                     },
//                     child: Text('  Sign Up',
//                         style: TextStyle(color: kPrimaryColor)),
//                   ),
//                 ],
//               ),
//               Spacer(flex: 2),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void login() async {
//     try {
//       final Dio dio = Dio();
//       final response = await dio.post(
//         'https://mohamednowar.pythonanywhere.com/api/login/',
//         data: {
//           "email": emailController.text,
//           "password": passwordController.text,
//         },
//       );
//       print(response.data);
//       if (response.statusCode == 201 || response.statusCode == 200) {
//         await CacheHelper.saveData(
//             key: 'refreshToken', value: response.data['refresh']);
//         await CacheHelper.saveData(
//             key: 'accessToken', value: response.data['access']);
//         await CacheHelper.saveData(
//             key: 'password', value: passwordController.text);

//         final accessToken = CacheHelper.getString(key: 'accessToken');
//         final refreshToken = CacheHelper.getString(key: 'refreshToken');

//         debugPrint('---------------------------');
//         debugPrint(accessToken);
//         debugPrint(refreshToken);
//         debugPrint('---------------------------');

//         // Navigator.pushReplacement(
//         //   context,
//         //   MaterialPageRoute(
//         //     builder: (context) => ShopScreen(),
//         //   ),
//         // );
//       }
//     } on DioException catch (e) {
//       // showToast(msg: e.response!.data["message"]);
//       debugPrint('my error is ${e.response}');
//     }
//   }
// }
