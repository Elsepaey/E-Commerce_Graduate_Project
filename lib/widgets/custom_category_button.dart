import 'package:flutter/material.dart';

class CustomCategoryButton extends StatelessWidget {
CustomCategoryButton({required this.title,});
String title;
// final bool isSelected; // New parameter
//   final VoidCallback onTap; // Callback for button ta
  @override
  Widget build(BuildContext context) {
    return Container(
decoration: BoxDecoration(
          color:Color(0xFF9EA199),
          borderRadius: BorderRadius.circular(10),
        ),
        width:62 ,
        height:40 ,
        child: Center(
            child: Text(
          title,
          style: TextStyle(color: Colors.white,fontSize: 12),
        )




        )
    );
  }
}