import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../database/database.dart';
import '../../model/user_model.dart';
import '../../view_model/edit_details_view_models/edit_view_model.dart';
import 'edit_details_widget/edit_email_widget.dart';
import 'edit_details_widget/edit_name_widget.dart';
import 'edit_details_widget/edit_password_widget.dart';

class EditUserDetails extends StatefulWidget {
  const EditUserDetails({Key? key}) : super(key: key);

  @override
  State<EditUserDetails> createState() => _EditUserDetailsState();
}

class _EditUserDetailsState extends State<EditUserDetails> {
  late Future<User?> _userFuture;
  final dbHelper = DatabaseHelper();
  late final String email;
  final _formKey = GlobalKey<FormState>();
//---------for instance of EditViewDetailsModel
  final controller = Get.put(EditViewDetailsModel());

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
            controller.phoneController.text = snapshot.data!.phoneNumber!;
            return Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    //---for name
                    EditNameWidget(controller: controller,),
                    //---for email
                    EditEmailWidget(controller: controller,),
                    //----for password
                    EditPasswordWidget(controller: controller,),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          controller.updateUserDetails();
                        }
                      },
                      child: Text('Update'),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
