// import 'package:flutter/material.dart';

// class CustomMessageTextfield extends StatelessWidget {
// CustomMessageTextfield({super.key});
// String? hinttext;
//   @override
//   Widget build(BuildContext context) {
//     return TextField(
      
//       decoration: InputDecoration(
//           hintText: hinttext,
//           hintStyle: TextStyle(color: const Color.fromARGB(255, 174, 165, 165)),
//           enabledBorder: OutlineInputBorder(
            
//             borderRadius: BorderRadius.circular(16),
//             borderSide: BorderSide(
//               color: const Color.fromARGB(255, 45, 88, 47),
//               //dont click
//             ),
//           ),
//           border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(16),
//               borderSide: BorderSide(
//                 color: const Color.fromARGB(255, 45, 88, 47),
//               ))),
//     );
//   }
// }
import 'package:flutter/material.dart';

class CustomMessageTextfield extends StatelessWidget {
  CustomMessageTextfield({super.key});

  String? hintText; // Use camelCase for variable names

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      
       
       
    //  width: 200,
       height:300,
    child:   TextField(
      decoration: InputDecoration(
       
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
      
          
              color: const Color.fromARGB(255, 45, 88, 47),
              //dont click
            ),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
        
                color: const Color.fromARGB(255, 45, 88, 47),
              ))),
    )          
    );
  }
}


