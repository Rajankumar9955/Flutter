import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pro1/Task/LoginSection/CreateUser_page.dart';
import 'package:pro1/Task/LoginSection/Login_Page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterationController extends GetxController {
  TextEditingController userController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController mobileController = TextEditingController();

  TextEditingController dobController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPassController = TextEditingController();

  bool selected = false;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> UserRegistration() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(
        "https://phplaravel-1264682-5431883.cloudwaysapps.com/api/user/signup",
      );
      var body = {
        "username": userController.text,
        "email": emailController.text,
        "mobile_number": mobileController.text,
        "dob": dobController.text,
        "terms": selected.toString(),
        "password": passwordController.text,
        "password_confirmation": confirmPassController.text,
      };
      print(body);
      final response = await http.post(
        url,
        body: body,
        // headers: headers,
      );
      print(response.statusCode);
      print(response.body.toString());
      if (response.statusCode == 200) {
        Get.offAll(LoginPage());
        Get.snackbar("Success", "Account create success");
      }
    } catch (e) {
      print(e.toString());
      // Get.to(CreateUserPage());
      Get.snackbar("Error", e.toString());
      print(e.toString());
    }
  }
}
