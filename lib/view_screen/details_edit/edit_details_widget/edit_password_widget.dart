import 'package:flutter/material.dart';

import '../../../view_model/edit_details_view_models/edit_view_model.dart';

class EditPasswordWidget extends StatelessWidget {
  final EditViewDetailsModel controller;
  EditPasswordWidget({required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller.passwordController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Password is required';
        }
        return null;
      },
      decoration: InputDecoration(labelText: 'Password'),
    );
  }
}
