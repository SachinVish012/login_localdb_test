import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../view_model/edit_details_view_models/edit_view_model.dart';

class EditNameWidget extends StatelessWidget {
  final EditViewDetailsModel controller;
  EditNameWidget({required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller.nameController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Name is required';
        }
        return null;
      },
      inputFormatters: [
        LengthLimitingTextInputFormatter(50),
        FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]")),
      ],
      decoration: InputDecoration(labelText: 'Name'),
    );
  }
}
