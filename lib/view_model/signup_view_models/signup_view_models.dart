import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_localdb_test/res/routes/routes_name.dart';

import '../../database/database.dart';
import '../../model/user_model.dart';

class SignupController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController mobileeController = TextEditingController();


  void signUp() async {
    final name = nameController.text;
    final email = emailController.text;
    final password = passwordController.text;
    final phone = mobileeController.text;

    User newUser = User(
      name: name,
      email: email,
      password: password,
      phoneNumber: phone,
    );
print(newUser.password.toString()+newUser.name.toString()+newUser.phoneNumber.toString()+newUser.email.toString());
    await DatabaseHelper().insertUser(newUser).then((value) {
      print("-------------");
      Get.offAllNamed(RoutesName.login_screen);
    });
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    mobileeController.dispose();
    super.onClose();
  }
}
