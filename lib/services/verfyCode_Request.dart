
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:graduate_project/screens/reset_password.dart';
import 'package:graduate_project/widgets/showfalsesnackbar.dart';
import 'package:http/http.dart' as http;

Future VerfyCode_Request({
  required BuildContext context,
  required Map<String, String> header,
  required dynamic bodys,
}) async {
  try {
    var responses = await http.post(
      Uri.parse("https://mohamednowar.pythonanywhere.com/api/verify_otp/"),
      body: jsonEncode(bodys),
      headers: header,
    );
    var bodyresponse = jsonDecode(responses.body);
    print(bodyresponse);
    print(responses.statusCode);
    if (responses.statusCode == 200 || responses.statusCode == 201) {
      print("bodyis ::::  ${bodyresponse.toString()}");
      if (bodyresponse['message'] != null) {
        print(" Request Successfully ");
        if (bodyresponse['message']
            .toString()
            .contains("OTP verified successfully")) {
          showTrueSnackBar(
              context: context,
              message: "OTP verified successfully",
              icon: Icons.check_circle);

          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ResetPassword()));
        } else if (bodyresponse['message'].toString().contains("Invalid OTP")) {
          showfalseSnackBar(
              context: context,
              message: "Invalid OTP",
              icon: Icons.dangerous_outlined);
        } else if (bodyresponse['message']
            .toString()
            .contains("Email and OTP are required")) {
          showfalseSnackBar(
              context: context,
              message: "Email and OTP are required!",
              icon: Icons.dangerous_outlined);
        }
      }
    } else if (responses.statusCode == 404 ||
        responses.statusCode == 400 ||
        responses.statusCode == 401 ||
        responses.statusCode == 402 ||
        responses.statusCode == 403) {
      print("${bodyresponse['message'].toString()}");
      if (bodyresponse['message'].toString().contains("Invalid OTP")) {
        showfalseSnackBar(
            context: context,
            message: "Invalid OTP",
            icon: Icons.dangerous_outlined);
      } else if (bodyresponse['message']
          .toString()
          .contains("Email and OTP are required")) {
        showfalseSnackBar(
            context: context,
            message: "Email and OTP are required!",
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
