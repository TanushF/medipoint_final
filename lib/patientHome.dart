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
import 'auth.dart';

class patientHome extends StatefulWidget {
  const patientHome({super.key});

  @override
  State<patientHome> createState() => _patientHomeState();
}

class _patientHomeState extends State<patientHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
        child: Text('Create Appointment'),
        onPressed: () async {
          appointmentService().getAppointments("test");
        },
      ),
    );
  }
}
