import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'fogetPassword.dart';
import 'router.dart';
import 'uncessfulMessage.dart';
import 'signUp.dart';
import 'Home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  String userEmail = "";
  @override
  Future<void> _incrementCounter() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString('userEmail', userEmail);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
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
                  hintText: 'Enter Your Email',
                  fillColor: Color.fromARGB(81, 192, 201, 228),
                  filled: true,
                )),
          ),
          Container(
            padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
            child: TextField(
                controller: _password,
                obscureText: true,
                style: TextStyle(),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 30.0, left: 20),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  label: Text('Password', textAlign: TextAlign.center),
                  hintText: 'Enter Your Password',
                  fillColor: Color.fromARGB(81, 192, 201, 228),
                  filled: true,
                )),
          ),
          Container(
            padding: new EdgeInsets.only(top: 50.0, bottom: 10.0, left: 3.0),
            child: ElevatedButton(
              onPressed: () {
                SignIn();
              },
              child: const Text('Login'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 27, 29, 175),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 120, vertical: 10),
                  textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  shape: StadiumBorder()),
            ),
          ),
          Container(
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUp()),
                );
              },
              style: TextButton.styleFrom(
                textStyle: const TextStyle(
                    fontSize: 20, color: Color.fromARGB(255, 62, 22, 164)),
              ),
              child: const Text("Already haven’t a account ? SignUp",
                  selectionColor: Color.fromARGB(255, 5, 3, 11)),
            ),
          ),
          Container(
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ForgetPassword()),
                );
              },
              style: TextButton.styleFrom(
                textStyle: const TextStyle(
                    fontSize: 20, color: Color.fromARGB(255, 62, 22, 164)),
              ),
              child: const Text(
                "Forget Password",
                selectionColor: Color.fromARGB(255, 5, 3, 11),
                style: TextStyle(color: Color.fromARGB(255, 138, 101, 230)),
              ),
            ),
          )
        ]),
      ),
    );
  }

  SignIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (_email.text.isEmpty) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return const UnscucessFulMessage(type: 'Please enter your email');
          });
    }
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: _email.text, password: _password.text)
        .then(
            (value) => {
                  prefs.setString('userEmail', _email.text),
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const router()),
                  )
                },
            onError: (e) => {
                  if (e.code == 'user-not-found')
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const UnscucessFulMessage(
                              type: 'Your email not Registered');
                        }),
                  if (e.code == 'wrong-password')
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const UnscucessFulMessage(
                              type: 'Your email not Registered');
                        }),
                });
  }
}
