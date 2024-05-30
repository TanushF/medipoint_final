import 'package:flutter/material.dart';
import 'login_page.dart';

//RENAME FROM SIGn IN tO SOMEThING ELSE

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          child: Column(children: [
            ElevatedButton(
              child: Text('log in'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LogIn()),
              ),
            )
          ]),
        ));
  }
}
