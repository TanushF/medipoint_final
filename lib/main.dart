import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

//import 'app_state.dart';
import 'firebase_options.dart';
//import 'logged_in_view.dart';
import 'login_page.dart';
import 'sign_up.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Medipoint App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Medipoint'),
        ),
        body: Container(
          margin: const EdgeInsets.all(5.0),
          child: Column(children: [
            ElevatedButton(
              child: Text('Log In'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LogIn()),
              ),
            ),
            ElevatedButton(
              child: Text('Sign Up'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignUp()),
              ),
            )
          ]),
        ));
  }
}
