import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:login_localdb_test/res/routes/routes_name.dart';
import '../../database/database.dart';
import '../../model/user_model.dart';

class UserDetailsView extends StatefulWidget {
  UserDetailsView({Key? key}) : super(key: key);

  @override
  State<UserDetailsView> createState() => _UserDetailsViewState();
}

class _UserDetailsViewState extends State<UserDetailsView> {
  late Future<User?> _userFuture;
  final dbHelper = DatabaseHelper();
  late final email;

  @override
  void initState() {
    super.initState();
    email = Get.arguments;
    print(email.toString());
    _userFuture = dbHelper.getUserByEmail(email.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 4),
              child: IconButton(
                icon: Icon(Icons.edit),
                color: Colors.blue,
                onPressed: (){
                  Get.toNamed(RoutesName.user_dataEdit,arguments:email);
                },
              )
          ),
          Container(
              margin: EdgeInsets.only(right: 20),
              child: IconButton(
                icon: Icon(Icons.logout_outlined),
                color: Colors.blue,
                onPressed: (){
                  Get.offAllNamed(RoutesName.login_screen);
                },
              )
          ),
        ],
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height / 3.6,
          width: double.infinity,
          child: Card(
            margin: EdgeInsets.all(16.0),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: FutureBuilder<User?>(
                future: _userFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    final user = snapshot.data;
                    if (user != null) {
                      return SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name: ${user.name}',
                              style: TextStyle(fontSize: 18.0),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'Mobile: ${user.phoneNumber}',
                              style: TextStyle(fontSize: 18.0),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'Email: ${user.email}',
                              style: TextStyle(fontSize: 18.0),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'Password: ${user.password}',
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return Text(
                        'User not found',
                        style: TextStyle(fontSize: 18.0),
                      );
                    }
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
