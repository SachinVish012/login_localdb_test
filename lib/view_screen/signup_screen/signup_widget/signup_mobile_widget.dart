import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../view_model/signup_view_models/signup_view_models.dart';

class SignupMobileWidget extends StatelessWidget {
  final SignupController signupController;
  SignupMobileWidget({required this.signupController});


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: signupController.mobileeController,
      decoration: InputDecoration(labelText: 'Phone Number'),
      maxLength: 10,
      keyboardType: TextInputType.number,
      inputFormatters: [LengthLimitingTextInputFormatter(10)],
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your phone number';
        }
        return null;
      },
    );
  }
}
