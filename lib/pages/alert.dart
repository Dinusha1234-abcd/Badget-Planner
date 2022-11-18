import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Alert extends StatefulWidget {
  const Alert({Key? key, required this.type}) : super(key: key);
  final String type;
  @override
  State<Alert> createState() => _AlertState();
}

class _AlertState extends State<Alert> {
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
                  'assests/images/alert.png',
                  fit: BoxFit.cover,
                )),
            Container(
                padding: const EdgeInsets.all(8.0),
                child: const Text(
                  'Alert',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 123, 111, 21),
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
