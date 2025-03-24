// import 'package:flutter/material.dart';
// import 'package:graduate_project/constants.dart';

// class CustomShortbutton extends StatelessWidget {
//   CustomShortbutton({required this.title});
//   String title;

//   @override
//   Widget build(BuildContext context) {
//     return //GestureDetector(
//         //   onTap: () {
//         //     Navigator.pushNamed(context, 'ShopScreen');
//         //   },
//         //   child:
//         Container(
//       decoration: BoxDecoration(
//         color: kPrimaryColor,
//         borderRadius: BorderRadius.circular(32),
//       ),
//       width: 170,
//       height: 40,
//       child: Center(
//           child: Text(
//         title,
//         style: TextStyle(color: Colors.white),
//       )

//           //style: TextStyle(color: Colors.white),

//           ),
//     );
//     //  );
      
//   }
//  }


// after api of contact us

import 'package:flutter/material.dart';
import 'package:graduate_project/constants.dart';

class CustomShortbutton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed; // Optional callback for button press

  CustomShortbutton({required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed, // Trigger callback on tap
      child: Container(
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(32),
        ),
        width: 170,
        height: 40,
        child: Center(
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
