import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_localdb_test/res/routes/routes_name.dart';

import '../../database/database.dart';

class EditViewDetailsModel extends GetxController{
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final dbHelper = DatabaseHelper();

  // Update method to update user details
  Future<void> updateUserDetails() async {
    final newName = nameController.text;
    final newEmail = emailController.text;
    final newPassword = passwordController.text;
    await dbHelper.editUserDetailsByMobile(phoneController.text, newName, newEmail, newPassword);

    // Navigate back after updating
    Get.offAllNamed(RoutesName.user_dataView,arguments: newEmail);
  }

}