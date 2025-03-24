import 'package:flutter/material.dart';
import 'package:graduate_project/constants.dart';

class CustomCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15, top: 10),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      decoration: BoxDecoration(
        color: Color(0xFFF6F6F6),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
        
            Image.asset(
              'assets/images/fraise.jpeg',
              width: 100,
              height: 100,
            ),
          Text(
            'Plant Name',
            style: TextStyle(
                color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            'Indoor',
            style: TextStyle(
                color: Color.fromARGB(255, 234, 228, 228), fontSize: 20),
          ),
          Text(
            '\$250',
            style: TextStyle(color: kPrimaryColor, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
