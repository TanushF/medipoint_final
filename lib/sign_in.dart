import 'package:flutter/material.dart';
import 'login_page.dart';

//RENAME FROM SIGn IN tO SOMEThING ELSE

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Medipoint'),
        ),
        body: Container(
          margin: const EdgeInsets.all(5.0),
          child: Column(children: [
            // ElevatedButton(
            //   child: Text('Log In'),
            //   onPressed: () => Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => LogIn()),
            //   ),
            // )
          ]),
        ));
  }
}
