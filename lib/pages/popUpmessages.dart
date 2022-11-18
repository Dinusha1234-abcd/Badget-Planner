import 'package:flutter/material.dart';

class Message extends StatefulWidget {
  const Message({Key? key, required this.type}) : super(key: key);
  final String type;
  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        width: 300,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(
                color: const Color.fromARGB(255, 143, 166, 235), width: 2.0)),
        child: Column(children: <Widget>[
          SizedBox(
              height: 90,
              width: 90,
              child: Image.asset(
                'assests/images/login.png',
                fit: BoxFit.cover,
              )),
          Container(
              // padding: const EdgeInsets.all(2),
              child: Text(
            '${widget.type}',
            textAlign: TextAlign.center,
            style: TextStyle(
              // fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 18,
            ),
          )),
        ]));
  }
}
