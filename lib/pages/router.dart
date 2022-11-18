import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'menu.dart';
import 'signIn.dart';
import './home.dart';

class router extends StatefulWidget {
  const router({super.key});

  @override
  State<router> createState() => _routerState();
}

class _routerState extends State<router> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Menu();
            } else {
              return SignIn();
            }
          }),
    );
  }
}
