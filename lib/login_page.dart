import 'package:flutter/material.dart';
import 'auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

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
  bool isDoctor = false;
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
            ElevatedButton(
              child: Text('Sign In'),
              onPressed: () async {
                if (_formKeyEmail.currentState!.validate() &&
                    _formKeyPassword.currentState!.validate()) {
                  _formKeyEmail.currentState!.save();
                  _formKeyPassword.currentState!.save();
                  await AuthService()
                      .signInWithEmailAndPassword(inputEmail, inputPassword)
                      .then((e) {
                    if (FirebaseAuth.instance.currentUser != null) {
                      print(FirebaseAuth.instance.currentUser?.uid);
                      AuthService()
                          .getUserInfo(FirebaseAuth.instance.currentUser!.uid);
                    }
                  });
                }
              },
            ),
          ]),
        ));
  }
}

const List<String> list = <String>['Patient', 'Doctor'];

class DoctorDropdown extends StatefulWidget {
  const DoctorDropdown({super.key, required this.onValueChange});
  final ValueChanged<String?> onValueChange;
  @override
  State<DoctorDropdown> createState() =>
      _DoctorDropdownState(onValueChange: onValueChange);
}

class _DoctorDropdownState extends State<DoctorDropdown> {
  String dropdownValue = list.first;
  _DoctorDropdownState({required this.onValueChange});
  final ValueChanged<String?> onValueChange;
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          onValueChange(value);
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
