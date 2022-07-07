import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../controllers/google_signin.dart';
import '../models/user.dart';
import 'loggedin_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _signInContainer(),
    );
  }

  Widget _signInContainer() {
    return Center(
      child: Container(
        height: 200,
        child: Column(
          children: [
            Text("Not Signed In"),
            ElevatedButton(
                onPressed: _signIn, child: Text("Sign In with Google"))
          ],
        ),
      ),
    );
  }

  Future _signIn() async {
    final u = await GoogleSignInApi.login();
    User user = User(user: u!.displayName as String, email: u.email);

    if (u == null) {
      print('failed');
    } else
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => LoggedInPage(user: user),
      ));
    // print(user.toString());
    // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> LoggedInPage(user: user)))
  }
}
