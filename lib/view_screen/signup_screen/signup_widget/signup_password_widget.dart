import 'package:flutter/material.dart';

import '../../../view_model/signup_view_models/signup_view_models.dart';

class SignupPasswordWodget extends StatelessWidget {
  final SignupController signupController;
  SignupPasswordWodget({required this.signupController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: signupController.passwordController,
      decoration: InputDecoration(labelText: 'Password'),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter a password';
        }
        return null;
      },
      obscureText: true,
    );
  }
}
