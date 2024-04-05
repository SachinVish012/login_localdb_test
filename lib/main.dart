import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_localdb_test/res/routes/routes.dart';
import 'package:login_localdb_test/res/routes/routes_name.dart';
import 'package:login_localdb_test/view_screen/signup_screen/signup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignupScreenView(),
      initialRoute: RoutesName.login_screen,
      getPages: AppRoutes.pageRoutes(),
    );
  }
}
