import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_localdb_test/res/routes/routes_name.dart';
import '../../database/database.dart';

class LoginController extends GetxController {
  final email = TextEditingController();
  final password = TextEditingController();

  RxBool isLoading = false.obs;

  //----call for login with credential
  void login() async {
    isLoading.value = true;
    final emailText = email.text;
    final passwordText = password.text;

    bool loggedIn = await DatabaseHelper().loginUser(emailText, passwordText);

    if (loggedIn) {
      print("LogedIn");
      Get.offAllNamed(RoutesName.user_dataView, arguments: emailText);
    } else {
      Get.defaultDialog(
        title: 'Login Failed',
        content: Text('Invalid email or password.'),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      );
    }

    isLoading.value = false;
  }

}
