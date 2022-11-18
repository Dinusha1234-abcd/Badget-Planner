import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key, required this.type}) : super(key: key);
  final String type;
  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: <Widget>[
            SizedBox(
                height: 90,
                width: 90,
                child: Image.asset(
                  'assests/images/login.png',
                  fit: BoxFit.cover,
                )),
            Container(
                padding: const EdgeInsets.all(8.0),
                child: const Text(
                  'Welcome   Badget Planner',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 36, 53, 184),
                    fontSize: 30,
                  ),
                )),
            Container(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${widget.type}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 20,
                  ),
                )),
          ])),
    );
  }
}
