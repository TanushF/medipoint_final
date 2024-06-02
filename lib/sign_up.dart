import 'package:flutter/material.dart';
import 'auth.dart';
import 'login_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String inputEmail = '';
  String inputPassword = '';
  String confirmPassword = '';
  final _formKeyEmail = GlobalKey<FormState>();
  final _formKeyPassword = GlobalKey<FormState>();
  final _formKeyConfirmPassword = GlobalKey<FormState>();
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
                child: Form(
                    key: _formKeyEmail,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                            hintText: 'Email',
                            filled: true,
                          ),
                          onChanged: (value) {
                            inputEmail = value;
                            print(inputEmail);
                          },
                        )
                      ],
                    ))),
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
                child: Form(
                    key: _formKeyPassword,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                            hintText: 'Password',
                            filled: true,
                          ),
                          onChanged: (value) {
                            inputPassword = value;
                            print(inputPassword);
                          },
                        )
                      ],
                    ))),
            SizedBox(height: 40),
            const Text(
              'Confirm password:',
              style: TextStyle(
                fontFamily: 'TimesNewRoman',
                fontSize: 17,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Form(
                    key: _formKeyConfirmPassword,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                            hintText: 'Password',
                            filled: true,
                          ),
                          onChanged: (value) => confirmPassword = value,
                        )
                      ],
                    ))),
            ElevatedButton(
              child: Text('Sign Up'),
              onPressed: () async {
                print(inputEmail);
                print(inputPassword);
                print(_formKeyEmail.currentState);
                print(_formKeyPassword.currentState);
                if (_formKeyEmail.currentState!.validate() &&
                    _formKeyPassword.currentState!.validate()) {
                  _formKeyEmail.currentState!.save();
                  _formKeyPassword.currentState!.save();
                  await AuthService()
                      .signUpWithEmailAndPassword(inputEmail, inputPassword)
                      .then((e) =>
                          MaterialPageRoute(builder: (context) => LogIn()));
                }
                MaterialPageRoute(builder: (context) => LogIn());
              },
            ),
          ]),
        ));
  }
}
