


import 'package:flutter/material.dart';

class CustomTextfieldStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none, children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
            width: double.infinity,
            height: 130,
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color:Color(0xFFE8AD03),
              borderRadius: BorderRadius.circular(20.0),
            ),
        
        
        
        
            
            child:SingleChildScrollView(
              child: Column(
                //  crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  //
                 SizedBox(width: 10,),
                  Text(
                    'Popular Plants',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                 
                 Column(
            mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     Text(
                        '          Lorem ipsum dolor sit amet conecttur',
                       
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                     
                       Text(
                        '         Lorem ipsum dolor sit amet conctetur',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                   ],
                 ),
               
                ],
              ),
              
            )),
      ),
   
      Positioned(
        top: -50,
        left: -20,
        child: Image.asset('assets/images/stack_plant.png'),
      )
    ]);
  }
}
