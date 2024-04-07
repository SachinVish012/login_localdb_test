import 'package:get/get.dart';
import 'package:login_localdb_test/res/routes/routes_name.dart';
import 'package:login_localdb_test/view_screen/login_view_screen/login_screen.dart';
import 'package:login_localdb_test/view_screen/signup_screen/signup_screen.dart';
import 'package:login_localdb_test/view_screen/user_data_view/user_details_view.dart';

import '../../view_screen/details_edit/details_edit_screen.dart';

class AppRoutes {
  static pageRoutes() => [
    GetPage(
        name: RoutesName.login_screen,
        page: ()=>LoginViewScreen()
    ),
    GetPage(
        name: RoutesName.signup_screen,
        page: ()=>SignupScreenView()
    ),
    GetPage(
        name: RoutesName.user_dataView,
        page: ()=>UserDetailsView()
    ),
    GetPage(
        name: RoutesName.user_dataEdit,
        page: ()=>EditUserDetails()
    ),
  ];
}
