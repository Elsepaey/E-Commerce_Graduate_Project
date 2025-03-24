


import 'package:flutter/material.dart';
import 'package:graduate_project/constants.dart';

class WhoAreUsScreen  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: kWhiteColor,
        appBar: AppBar(
          backgroundColor: kWhiteColor,
        ),
        body: Stack(
          children: [
            // Background Image
            Image.asset(
              'assets/images/Vector 2202 (1).png', // Replace with your image URL
              // fit: BoxFit.cover,
               height: double.infinity,
              // width: double.infinity,
            ),
            // Foreground Content
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "WHO ARE WE?",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
Container(
  width: 65,
  child: Divider(
                      thickness: 3,
                      color: kPrimaryColor,
                    ),
),
SizedBox(height: 20),
                  Text(
                    "At GroVana, we blend nature with innovation and AI-powered tools to make plant care simple and enjoyable.",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Whether you’re new to gardening or an experienced grower, we offer quality plants, expert advice, and smart AI assistance to help you thrive.",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                //  SizedBox(height: 20),
                  Image.asset(
                      'assets/images/Black_and_Green_Flat_Illustrated_Organic_Cosmetics_Logo__2_-removebg-preview 1.png',height: 65,width: 65,),
                  
                  Text(
                    "Join us in creating a greener, more beautiful world, one plant at a time.",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "310 E 67th St, New York,\nNY 10065, USA",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "📞 (123) 567 89 00",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "✉️ hello@gmail.com",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
















