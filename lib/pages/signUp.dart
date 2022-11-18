import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cool_alert/cool_alert.dart';
import 'sucessfulMessage.dart';
import 'uncessfulMessage.dart';

import 'signIn.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            Container(
              margin:
                  const EdgeInsets.only(top: 80.0, bottom: 10.0, right: 20.0),
              child: Image.asset('assests/images/login.png'),
            ),
            Container(
              width: 400.0,
              padding: const EdgeInsets.only(
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
              padding:
                  const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
              child: TextField(
                  controller: _name,
                  style: const TextStyle(),
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(top: 30.0, left: 20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    label: Text('Name', textAlign: TextAlign.center),
                    hintText: 'Enter Your Name',
                    fillColor: Color.fromARGB(81, 192, 201, 228),
                    filled: true,
                  )),
            ),
            Container(
              padding:
                  const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
              child: TextField(
                  controller: _email,
                  style: const TextStyle(),
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(top: 30.0, left: 20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    label: Text('Email', textAlign: TextAlign.center),
                    hintText: 'Enter Your Email',
                    fillColor: Color.fromARGB(81, 192, 201, 228),
                    filled: true,
                  )),
            ),
            Container(
              padding:
                  const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
              child: TextField(
                  controller: _password,
                  style: TextStyle(),
                  obscureText: true,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(top: 30.0, left: 20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    label: Text('Password', textAlign: TextAlign.center),
                    hintText: 'Enter Password',
                    fillColor: Color.fromARGB(81, 192, 201, 228),
                    filled: true,
                  )),
            ),
            Container(
              padding:
                  const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
              child: TextField(
                  controller: _confirmPassword,
                  style: TextStyle(),
                  obscureText: true,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(top: 30.0, left: 20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    label:
                        Text('Confirm Password', textAlign: TextAlign.center),
                    hintText: 'Enter Confirm Password',
                    fillColor: Color.fromARGB(81, 192, 201, 228),
                    filled: true,
                  )),
            ),
            Container(
              padding:
                  const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
              child: ElevatedButton(
                onPressed: SignUpuser,
                child: const Text('Register'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 27, 29, 175),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 130, vertical: 10),
                    textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    shape: const StadiumBorder()),
              ),
            ),
            Container(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignIn()),
                  );
                },
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 89, 35, 223)),
                ),
                child: const Text("Already have a account ? SignIn",
                    selectionColor: Color.fromARGB(255, 5, 3, 11)),
              ),
            )
          ]),
        ));
  }

  SignUpuser() async {
    var db = FirebaseFirestore.instance;
    if (_name.text.isEmpty) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return const UnscucessFulMessage(type: 'Please enter your Name');
          });
    } else if (_email.text.isEmpty) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return const UnscucessFulMessage(type: 'Please enter your email');
          });
    } else if (_confirmPassword.text == _password.text) {
      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _email.text,
          password: _password.text,
        );

        final user = <String, String>{"name": _name.text, "email": _email.text};

        db.collection("users").doc(_email.text.toString()).set(user);
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return SucessFulMessage(type: 'Registration Sucessfully');
            });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return UnscucessFulMessage(
                    type: 'The password provided is too weak');
              });
        } else if (e.code == 'email-already-in-use') {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return UnscucessFulMessage(type: 'Email is already in use');
              });
        }
      } catch (e) {
        print(e);
      }
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return UnscucessFulMessage(
                type: 'Confirm Password and Password is not match');
          });
    }
  }
}
