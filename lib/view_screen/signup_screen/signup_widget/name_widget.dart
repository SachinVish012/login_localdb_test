import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../view_model/signup_view_models/signup_view_models.dart';

class SignupNameWidget extends StatelessWidget {
  final SignupController signupController;

  SignupNameWidget({required this.signupController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: signupController.nameController,
      decoration: InputDecoration(labelText: 'Name'),
      inputFormatters: [
        LengthLimitingTextInputFormatter(50),
        FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]")),
      ],
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your name';
        }
        return null;
      },
    );
  }
}
