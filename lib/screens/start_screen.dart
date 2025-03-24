import 'package:flutter/material.dart';
import 'package:graduate_project/constants.dart';
import 'package:graduate_project/screens/login_page.dart';
import 'package:graduate_project/screens/signup_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image.asset("assets/images/photo_logo.jpg"),
          const Text('Continue to the App',
              style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 32,
                  fontWeight: FontWeight.bold)),
          const Text(
            'Make Your Home Green',
            style: TextStyle(color: Colors.black, fontSize: 17),
          ),
          const SizedBox(height: 20),
          MaterialButton(
            color: kPrimaryColor,
            textColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              //side: BorderSide(color:Colors.green ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            height: 60,
            minWidth: 350,
            child: const Text(
              'Login',
            ),
          ),
          const SizedBox(height: 20),
          MaterialButton(
            color: Colors.white,
            textColor: kPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: const BorderSide(color: kPrimaryColor),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignupScreen()),
              );
            },
            height: 60,
            minWidth: 350,
            child: const Text('Sign up'),
          ),
          const SizedBox(height: 20),
          const Text(
            'Gust',
            style: TextStyle(
                color: kPrimaryColor,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
