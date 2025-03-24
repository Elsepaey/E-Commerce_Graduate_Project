

import 'package:flutter/material.dart';
import 'package:graduate_project/constants.dart';

class ScannerScreen extends StatelessWidget {
  ScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Stack for the background image and scanning area
            Expanded(
              child: Stack(
                children: [
                  // Background image (placeholder for camera preview)
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/Frame 37.png'), // Replace with your image
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Centering the scanning rectangle
                  Center(
                    child: Container(
                      width: 200, // Width of the scanning area
                      height: 300, // Height of the scanning area
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green, width: 2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Row with the three images
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 20.0), // Add padding if needed
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/u_auto-flash.png'),
                  SizedBox(width: 40),
                  Image.asset('assets/images/Group 15.png'),
                  SizedBox(width: 40),
                  Image.asset('assets/images/u_image.png'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
