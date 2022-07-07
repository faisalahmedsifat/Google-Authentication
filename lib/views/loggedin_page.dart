import 'package:flutter/material.dart';

import '../controllers/google_signin.dart';
import '../models/user.dart';
import 'home_page.dart';

class LoggedInPage extends StatelessWidget {
  LoggedInPage({required this.user, Key? key}) : super(key: key);
  User user;
  @override
  Widget build(BuildContext context) {
    Future _signOut() async {
      await GoogleSignInApi.logout();
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
    }

    return Scaffold(
      body: Center(
        child: Center(
          child: Container(
            height: 200,
            child: Column(
              children: [
                Text("Signed In"),
                Text(user.user),
                Text(user.email),
                ElevatedButton(onPressed: _signOut, child: Text("Sign Out"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
