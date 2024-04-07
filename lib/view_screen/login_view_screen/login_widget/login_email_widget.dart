import 'package:flutter/material.dart';

import '../../../view_model/login_view_model/login_view_model.dart';

class LoginEmailWidget extends StatelessWidget {
  final LoginController loginController;
  LoginEmailWidget({required this.loginController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: loginController.email,
      decoration: InputDecoration(labelText: 'Email'),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your email';
        }
        return null;
      },
    );
  }
}
