// import 'package:flutter/material.dart';
// import 'package:graduate_project/constants.dart';
// import 'package:graduate_project/screens/cache/cache_helper.dart';
// import 'package:graduate_project/screens/validator.dart/validator.dart';
// import 'package:graduate_project/widgets/custom_button.dart';
// import 'package:graduate_project/widgets/custom_password_textfield.dart';
// import 'package:graduate_project/widgets/custom_textfield.dart';
// import 'package:dio/dio.dart';
// class ForgotYourpassword extends StatefulWidget {
// ForgotYourpassword({super.key});

//   @override
//   State<ForgotYourpassword> createState() => _ForgotYourpasswordState();
// }

// class _ForgotYourpasswordState extends State<ForgotYourpassword> {
// final TextEditingController emailController = TextEditingController();
//   final GlobalKey<FormState> formKey =
//       GlobalKey<FormState>(); // Form key for validation

//   @override
//   void dispose() {
//     super.dispose();
//     emailController.dispose();
//   }



//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: kWhiteColor,
//       appBar: AppBar(
//         backgroundColor: kWhiteColor,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//          Spacer(flex: 1,),
//       Text('Forgot Your Password',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),

// SizedBox(height:100 ,),

//       Text(
//             'Your Gmail',
//             style: TextStyle(fontSize: 16),
//           ),
//           SizedBox(height: 5),
//           CustomTextfield(hinttext: 'Your email',controller: emailController,
//                 inputType: TextInputType.visiblePassword,
//                 validator: (value) => Validator.passwordValidator(value),
//               ),),



          
//           SizedBox(height: 15),
            
//         CustomButton(title: 'Send Mail'),
//  Spacer(flex: 1,),

//       ],
      
//       ),
//       )
//     );
//   }
// }


//  void login() async {
//     try {
//       final Dio dio = Dio();
//       final response = await dio.post(
//         'https://mohamednowar.pythonanywhere.com/api/get_otp/',
//         data: {
//           "email": emailController.text,
          
//         },
//       );

//       if (response.statusCode == 201 || response.statusCode == 200) {
//         await CacheHelper.saveData(
//             key: 'refreshToken', value: response.data['refresh']);
//         await CacheHelper.saveData(
//             key: 'accessToken', value: response.data['access']);

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









// import 'package:flutter/material.dart';
// import 'package:graduate_project/constants.dart';
// import 'package:graduate_project/screens/cache/cache_helper.dart';
// import 'package:graduate_project/screens/signup_screen.dart';
// import 'package:graduate_project/screens/validator.dart/validator.dart';
// import 'package:graduate_project/widgets/custom_button.dart';
// import 'package:graduate_project/widgets/custom_password_textfield.dart';
// import 'package:graduate_project/widgets/custom_textfield.dart';
// import 'package:dio/dio.dart';

// class ForgotYourpassword extends StatefulWidget {
//   const ForgotYourpassword({super.key});

//   @override
//   State<ForgotYourpassword> createState() => _ForgotYourpasswordState();
// }

// class _ForgotYourpasswordState extends State<ForgotYourpassword> {
//   final TextEditingController emailController = TextEditingController();
//   final GlobalKey<FormState> formKey =
//       GlobalKey<FormState>(); // Form key for validation

//   @override
//   void dispose() {
//     emailController.dispose();
//     super.dispose();
//   }

//   void sendResetEmail() async {
//     if (!formKey.currentState!.validate())
//       return; // Ensure form is valid before proceeding

//     try {
//       final Dio dio = Dio();
//       final response = await dio.post(
//         'https://mohamednowar.pythonanywhere.com/api/get_otp/',
//         data: {
//           "email": emailController.text,
//         },
//       );

//       if (response.statusCode == 201 || response.statusCode == 200) {
//         await CacheHelper.saveData(
//             key: 'refreshToken', value: response.data['refresh']);
//         await CacheHelper.saveData(
//             key: 'accessToken', value: response.data['access']);

//         final accessToken = CacheHelper.getString(key: 'accessToken');
//         final refreshToken = CacheHelper.getString(key: 'refreshToken');

        
//       }
//     } on DioException catch (e) {     
//       debugPrint('Error: ${e.response}');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: kWhiteColor,
//       appBar: AppBar(
//         backgroundColor: kWhiteColor,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: formKey, // Assign form key for validation
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 'Forgot Your Password',
//                 style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 100),
//               const Text(
//                 'Your Email',
//                 style: TextStyle(fontSize: 16),
//               ),
//               const SizedBox(height: 5),
//               CustomTextfield(
//                 hinttext: 'Your email',
//                 controller: emailController,
//                 inputType: TextInputType.emailAddress, 
//                 validator: (value) =>
//                     Validator.emailValidator(value), 
//               ),
//               const SizedBox(height: 15),
//               CustomButton(
//                 title: 'Send Mail',
//                 onTap: sendResetEmail, 
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }




 //d
//  import 'package:flutter/material.dart';
// import 'package:graduate_project/constants.dart';
// import 'package:graduate_project/screens/cache/cache_helper.dart';
// import 'package:graduate_project/screens/validator.dart/validator.dart';
// import 'package:graduate_project/widgets/custom_button.dart';
// import 'package:graduate_project/widgets/custom_textfield.dart';
// import 'package:dio/dio.dart';

// class ForgotYourpassword extends StatefulWidget {
//   const ForgotYourpassword({super.key});

//   @override
//   State<ForgotYourpassword> createState() => _ForgotYourpasswordState();
// }

// class _ForgotYourpasswordState extends State<ForgotYourpassword> {
//   final TextEditingController emailController = TextEditingController();
//   final GlobalKey<FormState> formKey =
//       GlobalKey<FormState>(); 
//   @override
//   void dispose() {
//     emailController.dispose();
//     super.dispose();
//   }

//   void sendResetEmail() async {
//     if (!formKey.currentState!.validate())
//       return; // Ensure form is valid before proceeding

//     try {
//       final Dio dio = Dio();
//       final response = await dio.post(
//         'https://mohamednowar.pythonanywhere.com/api/get_otp/',
//         data: {
//           "email": emailController.text,
//         },
//       );

//       if (response.statusCode == 201 || response.statusCode == 200) {
//         await CacheHelper.saveData(
//             key: 'refreshToken', value: response.data['refresh']);
//         await CacheHelper.saveData(
//             key: 'accessToken', value: response.data['access']);

//         // Navigate to the Verify Code page after successfully sending the email
//         Navigator.pushReplacementNamed(
//             context, 'VerifyCode'); // Ensure this route is defined
//       }
//     } on DioException catch (e) {
//       debugPrint('Error: ${e.response}');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: kWhiteColor,
//       appBar: AppBar(
//         backgroundColor: kWhiteColor,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: formKey, // Assign form key for validation
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 'Forgot Your Password',
//                 style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 100),
//               const Text(
//                 'Your Email',
//                 style: TextStyle(fontSize: 16),
//               ),
//               const SizedBox(height: 5),
//               CustomTextfield(
//                 hinttext: 'Your email',
//                 controller: emailController,
//                 inputType: TextInputType.emailAddress,
//                 validator: (value) => Validator.emailValidator(value),
//               ),
//               const SizedBox(height: 15),
//               CustomButton(
//                 title: 'Send Mail',
//                 onTap: sendResetEmail,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }





import 'package:flutter/material.dart';
import 'package:graduate_project/constants.dart';
import 'package:graduate_project/screens/cache/cache_helper.dart';
import 'package:graduate_project/screens/validator.dart/validator.dart';
import 'package:graduate_project/widgets/custom_button.dart';
import 'package:graduate_project/widgets/custom_password_textfield.dart';
import 'package:graduate_project/widgets/custom_textfield.dart';
import 'package:dio/dio.dart';
class ForgotYourpassword extends StatefulWidget {
ForgotYourpassword({super.key});

  @override
  State<ForgotYourpassword> createState() => _ForgotYourpasswordState();
}

class _ForgotYourpasswordState extends State<ForgotYourpassword> {
final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey =
      GlobalKey<FormState>(); // Form key for validation

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Spacer(flex: 1,),
      Text('Forgot Your Password',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),

SizedBox(height:100 ,),

      Text(
            'Your Gmail',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 5),
          CustomTextfield(hinttext: 'Your email',controller: emailController,
                inputType: TextInputType.visiblePassword,
                validator: (value) => Validator.passwordValidator(value),
              ),



          
          SizedBox(height: 15),
            
        CustomButton(title: 'Send Mail'),
 Spacer(flex: 1,),

      ],
      
      ),
      )
    );
  }
}


//mmmmmmmmmmm


