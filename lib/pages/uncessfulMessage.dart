import 'package:flutter/material.dart';

class UnscucessFulMessage extends StatefulWidget {
  const UnscucessFulMessage({Key? key, required this.type}) : super(key: key);
  final String type;
  @override
  State<UnscucessFulMessage> createState() => _UnscucessFulMessageState();
}

class _UnscucessFulMessageState extends State<UnscucessFulMessage> {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: <Widget>[
            SizedBox(
                height: 55,
                width: 55,
                child: Image.asset(
                  'assests/images/unsucess.png',
                  fit: BoxFit.cover,
                )),
            Container(
                padding: const EdgeInsets.all(8.0),
                child: const Text(
                  'Unsucess',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 184, 38, 27),
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
