import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:graduate_project/screens/login_page.dart';
import 'package:graduate_project/widgets/showfalsesnackbar.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future ResetNew_Pass({
  required BuildContext context,
  required Map<String, String> header,
  required dynamic bodys,
}) async {
  try {
    var responses = await http.post(
      Uri.parse("https://mohamednowar.pythonanywhere.com/api/reset_password/"),
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
            .contains("Password reset successfully")) {
          showTrueSnackBar(
              context: context,
              message: "Password reset successfully",
              icon: Icons.security);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
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
      if (bodyresponse["message"].toString().contains(
            "New password is required",
          )) {
        showfalseSnackBar(
            context: context,
            message: "Set New password !",
            icon: Icons.dangerous_outlined);
      }
      print("${bodyresponse['message'].toString()}");
      showfalseSnackBar(
          context: context,
          message: "Try again !",
          icon: Icons.dangerous_outlined);
    } else {
      showfalseSnackBar(
          context: context,
          message: "Try again !",
          icon: Icons.dangerous_outlined);
    }
  } catch (error) {
    print(" ${error.toString()}");
  }
}
