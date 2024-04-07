import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../database/database.dart';
import '../../model/user_model.dart';
import '../../view_model/edit_details_view_models/edit_view_model.dart';

class EditUserDetails extends StatefulWidget {
  const EditUserDetails({super.key});

  @override
  State<EditUserDetails> createState() => _EditUserDetailsState();
}

class _EditUserDetailsState extends State<EditUserDetails> {
  late Future<User?> _userFuture;
  final dbHelper = DatabaseHelper();
  final controller = Get.put(EditViewDetailsModel());
  late final email;

  @override
  void initState() {
    super.initState();
    email = Get.arguments;
    print(email.toString());
    _userFuture = dbHelper.getUserByEmail(email.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit User Details'),
      ),
      body: FutureBuilder<User?>(
        future: _userFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            controller.nameController.text = snapshot.data!.name!;
            controller.emailController.text = snapshot.data!.email!;
            controller.passwordController.text = snapshot.data!.password!;
            controller.phoneController.text=snapshot.data!.phoneNumber!;
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  TextField(
                    controller: controller.nameController,
                    decoration: InputDecoration(labelText: 'Name'),
                  ),
                  TextField(
                    controller: controller.emailController,
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                  TextField(
                    controller: controller.passwordController,
                    decoration: InputDecoration(labelText: 'Password'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.updateUserDetails();
                    },
                    child: Text('Update'),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
