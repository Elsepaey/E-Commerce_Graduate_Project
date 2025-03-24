import 'dart:convert';

// import 'package:elawadytv/screens/verfycode.dart';
// import 'package:elawadytv/widget/showsnackbar.dart';
import 'package:flutter/material.dart';
import 'package:graduate_project/screens/verify_code.dart';
import 'package:graduate_project/widgets/showfalsesnackbar.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future Send_OTPRequest({
  required BuildContext context,
  required Map<String, String> header,
  required dynamic bodys,
}) async {
  try {
    var responses = await http.post(
      Uri.parse("https://mohamednowar.pythonanywhere.com/api/get_otp/"),
      body: jsonEncode(bodys),
      headers: header,
    );
    var bodyresponse = jsonDecode(responses.body);
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (responses.statusCode == 200 || responses.statusCode == 201) {
      print("bodyis ::::  ${bodyresponse.toString()}");
      if (bodyresponse['message'] != null) {
        print(" Request Successfully ");
        if (bodyresponse['message']
            .toString()
            .contains("OTP sent to your email")) {
          showTrueSnackBar(
              context: context,
              message: "OTP sent to your email",
              icon: Icons.mark_email_unread_outlined);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => VerifyCode()));
        } else if (bodyresponse['message']
            .toString()
            .contains("User with this email does not exist")) {
          showfalseSnackBar(
              context: context,
              message: "User with this email does not exist",
              icon: Icons.dangerous_outlined);
        }
      }
    } else if (responses.statusCode == 404 ||
        responses.statusCode == 400 ||
        responses.statusCode == 401 ||
        responses.statusCode == 402 ||
        responses.statusCode == 403) {
      print("${bodyresponse['message'].toString()}");
      if (bodyresponse['message']
          .toString()
          .contains("User with this email does not exist")) {
        showfalseSnackBar(
            context: context,
            message: "User with this email does not exist",
            icon: Icons.dangerous_outlined);
      } else {
        showfalseSnackBar(
            context: context,
            message: "Try again!",
            icon: Icons.dangerous_outlined);
      }
    }
  } catch (error) {
    print(" ${error.toString()}");
  }
}
