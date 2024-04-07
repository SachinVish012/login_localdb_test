import 'package:flutter/material.dart';

import '../../../view_model/login_view_model/login_view_model.dart';

class LoginPassword extends StatelessWidget {
  final LoginController loginController;
  LoginPassword({required this.loginController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: loginController.password,
      decoration: InputDecoration(labelText: 'Password'),
      validator: (value) {
        if (value!.isEmpty ) {
          return 'Please enter your password';
        }
        return null;
      },
      obscureText: true,
    );
  }
}
