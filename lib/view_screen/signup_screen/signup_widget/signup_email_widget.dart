import 'package:flutter/material.dart';

import '../../../view_model/signup_view_models/signup_view_models.dart';

class SinupEmailWidget extends StatelessWidget {
  final SignupController signupController;
  SinupEmailWidget({required this.signupController});


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: signupController.emailController,
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
