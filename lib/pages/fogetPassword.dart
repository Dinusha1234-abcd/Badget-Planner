import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/pages/signIn.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
      Container(
        margin: EdgeInsets.only(top: 80.0, bottom: 10.0, right: 20.0),
        child: Image.asset('assests/images/login.png'),
      ),
      Container(
        width: 400.0,
        padding: new EdgeInsets.only(
            top: 20.0, bottom: 10.0, left: 30.0, right: 30.0),
        child: const Text(
          "Budget Planner",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 27, 29, 175),
            fontSize: 30,
          ),
        ),
      ),
      Container(
        padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
        child: TextField(
            controller: _email,
            style: TextStyle(),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: 30.0, left: 20),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              label: Text('Email', textAlign: TextAlign.center),
              hintText: 'Enter Email',
              fillColor: Color.fromARGB(81, 192, 201, 228),
              filled: true,
            )),
      ),
      Container(
        padding: new EdgeInsets.only(
            top: 12.0, bottom: 10.0, left: 11.0, right: 11.0),
        child: ElevatedButton(
          onPressed: () {
            resetPassword();
          },
          child: const Text('Send Reset Password Email'),
          style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 27, 29, 175),
              padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 10),
              textStyle: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              shape: StadiumBorder()),
        ),
      ),
      Container(
        child: TextButton(
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(builder: (context) => const SignIn()),
            );
          },
          style: TextButton.styleFrom(
            textStyle: const TextStyle(
                fontSize: 20, color: Color.fromARGB(255, 89, 35, 223)),
          ),
          child:
              const Text("Back", selectionColor: Color.fromARGB(255, 5, 3, 11)),
        ),
      )
    ])));
  }

  resetPassword() {
    print("call");
    print(_email.text.trim());

    FirebaseAuth.instance
        .sendPasswordResetEmail(email: _email.text.trim().toString());
  }
}
