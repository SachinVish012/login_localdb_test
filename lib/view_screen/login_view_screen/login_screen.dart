import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_localdb_test/res/routes/routes_name.dart';
import 'package:login_localdb_test/view_screen/login_view_screen/login_widget/login_email_widget.dart';

import '../../view_model/login_view_model/login_view_model.dart';
import 'login_widget/login_password_widget.dart';

class LoginViewScreen extends StatefulWidget {
  const LoginViewScreen({Key? key}) : super(key: key);

  @override
  _LoginViewScreenState createState() => _LoginViewScreenState();
}

class _LoginViewScreenState extends State<LoginViewScreen> {
  final _formKey = GlobalKey<FormState>();

  late final LoginController _loginController;

  @override
  void initState() {
    super.initState();
    _loginController = Get.put(LoginController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                LoginEmailWidget(loginController: _loginController),
                LoginPassword(loginController: _loginController),

                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _loginController.login();
                      }
                    },
                    child: Obx(() => _loginController.isLoading.value
                        ? CircularProgressIndicator()
                        : Text('Login')),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed(RoutesName.signup_screen);
                    },
                    child: Text('Signup'),
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
