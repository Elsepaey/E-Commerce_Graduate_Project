//  import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:graduate_project/constants.dart';
// import 'package:graduate_project/screens/cache/cache_helper.dart';
// import 'package:graduate_project/screens/validator.dart/validator.dart';
// import 'package:graduate_project/widgets/custom_button.dart';
// import 'package:graduate_project/widgets/custom_textfield.dart';

// class ContactUsScreen extends StatefulWidget {
//   @override
//   State<ContactUsScreen> createState() => _ContactUsScreenState();
// }

// class _ContactUsScreenState extends State<ContactUsScreen> {

//   final TextEditingController name = TextEditingController();
//   final TextEditingController email = TextEditingController();
// final TextEditingController phone= TextEditingController();
//   final TextEditingController message= TextEditingController();

//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();

//   @override
//   void dispose() {

//     super.dispose();
//     name.dispose();
//     email.dispose();

//     phone.dispose();
//     message.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(

//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: ListView(

//           children: [
//             Text(
//               'Contact Us', textAlign: TextAlign.center,
//               style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: kPrimaryColor),
//             ),
//             SizedBox(height: 8),
//             Text('Just write us a message!',style: TextStyle(fontSize: 16) ,textAlign: TextAlign.center,),
//             SizedBox(height: 20),

// Container(
//               width: 65,
//               child: Divider(
//                 thickness: 3,
//                 color: kPrimaryColor,
//               ),
//             ),

//             CustomTextfield(hinttext: 'Your Name',
//             controller:name,
            
//                             validator: (value) =>
//                                 Validator.displayNamevalidator(value)),

//             SizedBox(height: 20,),
//             CustomTextfield(hinttext: 'Your Email',
//             controller: email,
//                 inputType: TextInputType.emailAddress,
//                 validator: (value) => Validator.emailValidator(value)),
//             SizedBox(
//               height: 20,
//             ),
//             CustomTextfield(hinttext: 'Your Phone',
//             controller:phone ,
//                 inputType: TextInputType.phone,
//                 validator: (value) => Validator.validatePhone(value)),
              

//             SizedBox(height: 20,),
//             buildTextField('Message', isMessage: true),

//             SizedBox(height: 20),
//             CustomButton(title: 'Send')
//           ]
//         ),
//       ),
//     );
//   }

//   Widget buildTextField(String label, {bool isMessage = false}) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 16.0),
//       child: TextField(
//         maxLines: isMessage ? 4 : 1,
//         decoration: InputDecoration(
//           labelText: label,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(12), // Add border radius
//             borderSide: BorderSide(color: kPrimaryColor), // Border color
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(12), // Add border radius
//             borderSide: BorderSide(
//                 color: kPrimaryColor, width: 1), // Border color when enabled
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(12), // Add border radius
//             borderSide: BorderSide(
//                 color: kPrimaryColor, width: 2), // Border color when focused
//           ),
//         ),
//       ),
//     );
//   }
//   }





// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:graduate_project/constants.dart';
// import 'package:graduate_project/screens/cache/cache_helper.dart';
// import 'package:graduate_project/screens/validator.dart/validator.dart';
// import 'package:graduate_project/widgets/custom_button.dart';
// import 'package:graduate_project/widgets/custom_textfield.dart';

// class ContactUsScreen extends StatefulWidget {
//   @override
//   State<ContactUsScreen> createState() => _ContactUsScreenState();
// }

// class _ContactUsScreenState extends State<ContactUsScreen> {
//   final TextEditingController name = TextEditingController();
//   final TextEditingController email = TextEditingController();
//   final TextEditingController phone = TextEditingController();
//   final TextEditingController message = TextEditingController();
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();

//   bool isLoading = false;

//   @override
//   void dispose() {
//     name.dispose();
//     email.dispose();
//     phone.dispose();
//     message.dispose();
//     super.dispose();
//   }

//   Future<void> sendContactMessage() async {
//     if (!formKey.currentState!.validate()) return;

//     setState(() {
//       isLoading = true;
//     });

//     try {
//       final Dio dio = Dio();
//       final accessToken = CacheHelper.getString(key: 'accessToken');

//       final response = await dio.post(
//         'https://mohamednowar.pythonanywhere.com/api/contact/',
//         options: Options(
//           headers: {
//             'Content-Type': 'application/json',
//             'Authorization': 'Bearer $accessToken',
//           },
//         ),
//         data: {
//           "name": name.text,
//           "email": email.text,
//           "phone": phone.text,
//           "message": message.text,
//         },
//       );

//       if (response.statusCode == 200) {
//         showDialog(
//           context: context,
//           builder: (context) => AlertDialog(
//             title: const Text('Success'),
//             content: const Text('Email sent successfully!'),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                   name.clear();
//                   email.clear();
//                   phone.clear();
//                   message.clear();
//                 },
//                 child: const Text('OK'),
//               ),
//             ],
//           ),
//         );
//       }
//     } on DioException catch (e) {
//       showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//           title: const Text('Error'),
//           content: Text(e.response?.data["message"] ?? 'Something went wrong!'),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text('OK'),
//             ),
//           ],
//         ),
//       );
//     } finally {
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Contact Us')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: formKey,
//           child: ListView(
//             children: [
//               const Text(
//                 'Contact Us',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     color: kPrimaryColor),
//               ),
//               const SizedBox(height: 8),
//               const Text('Just write us a message!',
//                   style: TextStyle(fontSize: 16), textAlign: TextAlign.center),
//               const SizedBox(height: 20),
//               Container(
//                 width: 65,
//                 child: const Divider(thickness: 3, color: kPrimaryColor),
//               ),
//               CustomTextfield(
//                 hinttext: 'Your Name',
//                 controller: name,
//                 validator: (value) => Validator.displayNamevalidator(value),
//               ),
//               const SizedBox(height: 20),
//               CustomTextfield(
//                 hinttext: 'Your Email',
//                 controller: email,
//                 inputType: TextInputType.emailAddress,
//                 validator: (value) => Validator.emailValidator(value),
//               ),
//               const SizedBox(height: 20),
//               CustomTextfield(
//                 hinttext: 'Your Phone',
//                 controller: phone,
//                 inputType: TextInputType.phone,
//                 validator: (value) => Validator.validatePhone(value),
//               ),
//               const SizedBox(height: 20),
//               CustomTextfield(
//                 hinttext: 'Message',
//                 controller: message,
//                 inputType: TextInputType.text,
//                 validator: (value) =>
//                     value!.isEmpty ? 'Message cannot be empty' : null,
//                 maxLines: 4, // Now works correctly
//               ),
//               const SizedBox(height: 20),
//               CustomButton(
//                 title: isLoading ? 'Sending...' : 'Send',
//                 onTap: isLoading ? null : sendContactMessage,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:graduate_project/constants.dart';
import 'package:graduate_project/screens/cache/cache_helper.dart';
import 'package:graduate_project/screens/validator.dart/validator.dart';
import 'package:graduate_project/widgets/custom_button.dart';
import 'package:graduate_project/widgets/custom_textfield.dart';

class ContactUsScreen extends StatefulWidget {
  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    messageController.dispose();
    super.dispose();
  }

  Future<void> sendContactMessage() async {
    if (!formKey.currentState!.validate()) return;

    setState(() {
      isLoading = true;
    });

    try {
      final Dio dio = Dio();
      final accessToken = CacheHelper.getString(key: 'accessToken');

      final response = await dio.post(
        'https://mohamednowar.pythonanywhere.com/api/contact/',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $accessToken',
          },
        ),
        data: {
          "name": nameController.text,
          "email": emailController.text,
          "phone": phoneController.text,
          "message": messageController.text,
        },
      );

      if (response.statusCode == 200) {
        _showSuccessDialog();
      }
    } on DioException catch (e) {
      _showErrorDialog(e.response?.data["message"] ?? 'Something went wrong!');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Success'),
        content: const Text('Email sent successfully!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _clearFields();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _clearFields() {
    nameController.clear();
    emailController.clear();
    phoneController.clear();
    messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contact Us')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              const Text(
                'Contact Us',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor),
              ),
              const SizedBox(height: 8),
              const Text('Just write us a message!',
                  style: TextStyle(fontSize: 16), textAlign: TextAlign.center),
              const SizedBox(height: 20),
              Container(
                width: 65,
                child: const Divider(thickness: 3, color: kPrimaryColor),
              ),
              CustomTextfield(
                hinttext: 'Your Name',
                controller: nameController,
                validator: (value) => Validator.displayNamevalidator(value),
              ),
              const SizedBox(height: 20),
              CustomTextfield(
                hinttext: 'Your Email',
                controller: emailController,
                inputType: TextInputType.emailAddress,
                validator: (value) => Validator.emailValidator(value),
              ),
              const SizedBox(height: 20),
              CustomTextfield(
                hinttext: 'Your Phone',
                controller: phoneController,
                inputType: TextInputType.phone,
                validator: (value) => Validator.validatePhone(value),
              ),
              const SizedBox(height: 20),
              // CustomTextfield(
              //   hinttext: 'Message',
              //   controller: messageController,
              //   inputType: TextInputType.text,
              //   validator: (value) =>
              //       value!.isEmpty ? 'Message cannot be empty' : null,
              //   maxLines: 4,
              // ),
TextFormField(
      controller:messageController,
      
      validator:(value) =>
                     value!.isEmpty ? 'Message cannot be empty' : null,
      maxLines: 4, // Apply maxLines here
      decoration: InputDecoration(
        hintText: 'Message',hintStyle: TextStyle(color: Colors.grey),
        border: OutlineInputBorder(),
      ),
    ),





              const SizedBox(height: 20),
              CustomButton(
                title: isLoading ? 'Sending...' : 'Send',
                onTap: isLoading ? null : sendContactMessage,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
