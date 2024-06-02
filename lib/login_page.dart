import 'package:flutter/material.dart';
import 'auth.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  String inputEmail = '';
  String inputPassword = '';
  final _formKeyEmail = GlobalKey<FormState>();
  final _formKeyPassword = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          child: Column(children: [
            const Text(
              "Enter your email:",
              style: TextStyle(
                fontFamily: 'TimesNewRoman',
                fontSize: 17,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                key: _formKeyEmail,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: 'Email',
                  filled: true,
                ),
                onChanged: (value) => inputEmail = value,
              ),
            ),
            SizedBox(height: 40),
            const Text(
              'Enter your password:',
              style: TextStyle(
                fontFamily: 'TimesNewRoman',
                fontSize: 17,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                key: _formKeyPassword,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: 'Password',
                  filled: true,
                ),
                onChanged: (value) => inputPassword = value,
              ),
            ),
            ElevatedButton(
              child: Text('Sign In'),
              onPressed: () async {
                if (_formKeyEmail.currentState!.validate() &&
                    _formKeyPassword.currentState!.validate()) {
                  _formKeyEmail.currentState!.save();
                  _formKeyPassword.currentState!.save();
                  await AuthService()
                      .signInWithEmailAndPassword(inputEmail, inputPassword)
                      .then((e) => {print('success')});
                }
              },
            ),
          ]),
        ));
  }
}
