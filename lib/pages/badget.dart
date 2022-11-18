import 'package:flutter/material.dart';
import 'addBudget.dart';

class Budget extends StatefulWidget {
  const Budget({super.key});

  @override
  State<Budget> createState() => _BudgetState();
}

class _BudgetState extends State<Budget> {
  int type = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            child: Column(children: <Widget>[
      Container(
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 236, 246, 255),
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(
                color: const Color.fromARGB(255, 5, 45, 163), width: 2.0)),
        margin:
            const EdgeInsets.only(top: 30.0, bottom: 10, left: 10, right: 10),
        child: const Card(
          color: Color.fromARGB(255, 223, 224, 255),
          child: SizedBox(
            width: 800,
            height: 55,
            child: Center(
              child: Text('Badget Planner',
                  style: TextStyle(
                    color: Color.fromARGB(255, 27, 29, 175),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
        ),
      ),
      Column(children: <Widget>[
        Row(children: <Widget>[
          InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const addBudget(type: 'Food');
                    });
              },
              child: Container(
                  width: 150,
                  height: 120,
                  margin: const EdgeInsets.only(
                      left: 34.0, right: 10.0, bottom: 10.0),
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 236, 246, 255),
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                          color: const Color.fromARGB(255, 143, 166, 235),
                          width: 2.0)),
                  padding: const EdgeInsets.all(10.0),
                  child: Column(children: <Widget>[
                    SizedBox(
                        height: 55,
                        width: 55,
                        child: Image.asset(
                          'assests/images/food.png',
                          fit: BoxFit.cover,
                        )),
                    const Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "Food & Drinks",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ]))),
          InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const addBudget(type: 'Electricity');
                    });
              },
              child: Container(
                  width: 150,
                  height: 120,
                  margin: const EdgeInsets.only(
                      left: 10.0, right: 10.0, bottom: 10.0),
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 236, 246, 255),
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                          color: const Color.fromARGB(255, 143, 166, 235),
                          width: 2.0)),
                  padding: const EdgeInsets.all(10.0),
                  child: Column(children: <Widget>[
                    SizedBox(
                        height: 55,
                        width: 55,
                        child: Image.asset(
                          'assests/images/electricity.png',
                          fit: BoxFit.cover,
                        )),
                    const Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "Electricity Bill",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ]))),
        ]),
        Row(children: <Widget>[
          InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const addBudget(type: 'Loan');
                    });
              },
              child: Container(
                  width: 150,
                  height: 120,
                  margin: const EdgeInsets.only(
                      left: 34.0, right: 10.0, bottom: 10.0),
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 236, 246, 255),
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                          color: const Color.fromARGB(255, 143, 166, 235),
                          width: 2.0)),
                  padding: const EdgeInsets.all(10.0),
                  child: Column(children: <Widget>[
                    SizedBox(
                        height: 55,
                        width: 55,
                        child: Image.asset(
                          'assests/images/loan.png',
                          fit: BoxFit.cover,
                        )),
                    const Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "Bank Loan",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ]))),
          InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const addBudget(type: 'Insurance');
                    });
              },
              child: Container(
                  width: 150,
                  height: 120,
                  margin: const EdgeInsets.only(
                      left: 10.0, right: 10.0, bottom: 10.0),
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 236, 246, 255),
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                          color: const Color.fromARGB(255, 143, 166, 235),
                          width: 2.0)),
                  padding: const EdgeInsets.all(10.0),
                  child: Column(children: <Widget>[
                    SizedBox(
                        height: 55,
                        width: 55,
                        child: Image.asset(
                          'assests/images/insurance.png',
                          fit: BoxFit.cover,
                        )),
                    const Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "Insurance",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ]))),
        ]),
        Row(children: <Widget>[
          InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const addBudget(type: 'Water');
                    });
              },
              child: Container(
                  width: 150,
                  height: 120,
                  margin: const EdgeInsets.only(
                      left: 34.0, right: 10.0, bottom: 10.0),
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 236, 246, 255),
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                          color: const Color.fromARGB(255, 143, 166, 235),
                          width: 2.0)),
                  padding: const EdgeInsets.all(10.0),
                  child: Column(children: <Widget>[
                    SizedBox(
                        height: 55,
                        width: 55,
                        child: Image.asset(
                          'assests/images/water-tap.png',
                          fit: BoxFit.cover,
                        )),
                    const Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "Water Bill",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ]))),
          InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const addBudget(type: 'Internet');
                    });
              },
              child: Container(
                  width: 150,
                  height: 120,
                  margin: const EdgeInsets.only(
                      left: 10.0, right: 10.0, bottom: 10.0),
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 236, 246, 255),
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                          color: const Color.fromARGB(255, 143, 166, 235),
                          width: 2.0)),
                  padding: const EdgeInsets.all(10.0),
                  child: Column(children: <Widget>[
                    SizedBox(
                        height: 55,
                        width: 55,
                        child: Image.asset(
                          'assests/images/internet.png',
                          fit: BoxFit.cover,
                        )),
                    const Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "Internet",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ]))),
        ]),
        Row(children: <Widget>[
          InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const addBudget(type: 'Others');
                    });
              },
              child: Container(
                  width: 150,
                  height: 120,
                  margin: const EdgeInsets.only(
                      left: 34.0, right: 10.0, bottom: 10.0),
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 236, 246, 255),
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                          color: const Color.fromARGB(255, 143, 166, 235),
                          width: 2.0)),
                  padding: const EdgeInsets.all(10.0),
                  child: Column(children: <Widget>[
                    SizedBox(
                        height: 55,
                        width: 55,
                        child: Image.asset(
                          'assests/images/grocery-cart.png',
                          fit: BoxFit.cover,
                        )),
                    const Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "Others",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ]))),
        ]),
      ]),
    ])));
  }
}
