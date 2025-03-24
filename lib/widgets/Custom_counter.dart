import 'package:flutter/material.dart';
import 'package:graduate_project/constants.dart';

class CustomCounter extends StatefulWidget {
  final int initialValue;
  final int minValue;
  final int maxValue;
  final Function(int)? onChanged;

  const CustomCounter({
    Key? key,
    this.initialValue = 1,
    this.minValue = 1,
    this.maxValue = 999,
    this.onChanged,
  }) : super(key: key);

  @override
  CustomCounterState createState() => CustomCounterState();
}

class CustomCounterState extends State<CustomCounter> {
  late int count;

  @override
  void initState() {
    super.initState();
    count = widget.initialValue;
  }

  void increment() {
    if (count < widget.maxValue) {
      setState(() {
        count++;
      });
      if (widget.onChanged != null) {
        widget.onChanged!(count);
      }
    }
  }

  void decrement() {
    if (count > widget.minValue) {
      setState(() {
        count--;
      });
      if (widget.onChanged != null) {
        widget.onChanged!(count);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Decrement Button
        ElevatedButton(
          onPressed: decrement,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            backgroundColor: Colors.grey.shade300,
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            minimumSize: Size(32, 32), // Consistent size
          ),
          child: Icon(Icons.remove, color: Colors.black, size: 16),
        ),
        SizedBox(width: 8),
        Container(
          width: 40,
          alignment: Alignment.center,
          child: Text(
            '$count',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(width: 8),
        // Increment Button
        ElevatedButton(
          onPressed: increment,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            backgroundColor: kPrimaryColor,
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            minimumSize: Size(32, 32), // Consistent size
          ),
          child: Icon(Icons.add, color: Colors.white, size: 16),
        ),
      ],
    );
  }
}
