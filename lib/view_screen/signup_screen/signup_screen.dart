import 'package:flutter/material.dart';
import 'package:login_localdb_test/view_screen/signup_screen/signup_widget/name_widget.dart';
import 'package:login_localdb_test/view_screen/signup_screen/signup_widget/signup_email_widget.dart';
import 'package:login_localdb_test/view_screen/signup_screen/signup_widget/signup_mobile_widget.dart';
import 'package:login_localdb_test/view_screen/signup_screen/signup_widget/signup_password_widget.dart';

import '../../view_model/signup_view_models/signup_view_models.dart';

class SignupScreenView extends StatefulWidget {
  const SignupScreenView({Key? key}) : super(key: key);

  @override
  _SignupScreenViewState createState() => _SignupScreenViewState();
}

class _SignupScreenViewState extends State<SignupScreenView> {
  final _formKey = GlobalKey<FormState>();

  late final SignupController _signupController;

  @override
  void initState() {
    super.initState();
    _signupController = SignupController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //---widget for name
                SignupNameWidget(signupController: _signupController),
                //---widget for email
                SinupEmailWidget(signupController: _signupController),
                //-----widget for mobile number
                SignupMobileWidget(signupController: _signupController),
                //---widget for password
                SignupPasswordWodget(signupController: _signupController),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _signupController.signUp();
                        }
                      },
                      child: Text('Sign Up'),
                    ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
