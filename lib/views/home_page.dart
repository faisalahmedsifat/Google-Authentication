import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../controllers/google_signin.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _signedIn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _signedIn ? _signOutContainer() : _signInContainer(),
    );
  }
}

Widget _signInContainer() {
  return Center(
    child: Container(
      height: 200,
      child: Column(
        children: [
          Text("Not Signed In"),
          ElevatedButton(onPressed: _signIn, child: Text("Sign In with Google"))
        ],
      ),
    ),
  );
}

Widget _signOutContainer() {
  return Center(
    child: Container(
      height: 200,
      child: Column(
        children: [
          Text("Signed In"),
          ElevatedButton(onPressed: _signIn, child: Text("Sign Out"))
        ],
      ),
    ),
  );
}

Future _signIn() async {
  await GoogleSignInApi.login();
}
