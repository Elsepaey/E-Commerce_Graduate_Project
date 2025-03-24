import 'package:flutter/material.dart';

class ConnectWithAi extends StatelessWidget {
  // String ?title;

// CommunityScreen({required this.title});
//  String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Image.asset(
        'assets/images/Rectangle 4163.png',
      ),
      SizedBox(
        width: 10,
      ),
      Container(
        height: 500,
        width: 300,
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              Image.asset('assets/images/tick.png'),
              Text('Hooray! Your Plant is Healthy'),
            ],
          ),

          Text('Papaver Somniferum'),

        ]),
      )
    ]));
  }
}
