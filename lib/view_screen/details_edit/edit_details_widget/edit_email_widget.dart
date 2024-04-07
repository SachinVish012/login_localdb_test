import 'package:flutter/material.dart';

import '../../../view_model/edit_details_view_models/edit_view_model.dart';

class EditEmailWidget extends StatelessWidget {
  final EditViewDetailsModel controller;
  EditEmailWidget({required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller.emailController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Email is required';
        }
        return null;
      },
      decoration: InputDecoration(labelText: 'Email'),
    );
  }
}
