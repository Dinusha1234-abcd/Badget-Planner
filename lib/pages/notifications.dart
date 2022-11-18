import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled2/pages/popUpmessages.dart';

import 'alert.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  String day = "";
  bool status = true;
  String foodPrice = "";
  String foodDay = "";

  String electricityPrice = "";
  String electricityDay = "";

  String loanPrice = "";
  String loanDay = "";

  String insurancePrice = "";
  String insuranceDay = "";

  String waterPrice = "";
  String waterDay = "";

  String internetPrice = "";
  String internetDay = "";

  String otherPrice = "";
  String otherDay = "100";

  @override
  void initState() {
    super.initState();
    var now = new DateTime.now();
    day = ('${now.day}');
    if (day.length != 2) {
      day = "0" + day;
    }
    print(day);
    getData();
  }

  Widget build(BuildContext context) {
    return Container(
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
      if (foodDay.toString() == day.toString())
        InkWell(
            child: Container(
                width: 850,
                height: 55,
                margin: const EdgeInsets.only(
                    left: 10.0, right: 10.0, bottom: 10.0),
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 236, 246, 255),
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                        color: const Color.fromARGB(255, 143, 166, 235),
                        width: 2.0)),
                padding:
                    const EdgeInsets.only(left: 0.0, right: 10.0, top: 2.0),
                child: Stack(children: <Widget>[
                  SizedBox(
                      height: 45,
                      width: 45,
                      child: Image.asset(
                        'assests/images/food.png',
                        fit: BoxFit.cover,
                      )),
                  const Padding(
                      padding: EdgeInsets.only(
                        left: 55.0,
                        top: 20,
                      ),
                      child: Text(
                        "Today You have Money for Foods",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ]))),
      if (electricityDay == day)
        Center(
            child: Container(
                width: 850,
                height: 55,
                margin: const EdgeInsets.only(
                    left: 10.0, right: 10.0, bottom: 10.0),
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 236, 246, 255),
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                        color: const Color.fromARGB(255, 143, 166, 235),
                        width: 2.0)),
                padding:
                    const EdgeInsets.only(left: 0.0, right: 10.0, top: 2.0),
                child: Stack(children: <Widget>[
                  SizedBox(
                      height: 45,
                      width: 45,
                      child: Image.asset(
                        'assests/images/electricity.png',
                        fit: BoxFit.cover,
                      )),
                  const Padding(
                      padding: EdgeInsets.only(left: 55.0, top: 20),
                      child: Text(
                        "Today You have Electricity Payment",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ]))),
      if (loanDay == day)
        Center(
            child: Container(
                width: 850,
                height: 55,
                margin: const EdgeInsets.only(
                    left: 10.0, right: 10.0, bottom: 10.0),
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 236, 246, 255),
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                        color: const Color.fromARGB(255, 143, 166, 235),
                        width: 2.0)),
                padding:
                    const EdgeInsets.only(left: 0.0, right: 10.0, top: 2.0),
                child: Stack(children: <Widget>[
                  SizedBox(
                      height: 45,
                      width: 45,
                      child: Image.asset(
                        'assests/images/loan.png',
                        fit: BoxFit.cover,
                      )),
                  const Padding(
                      padding: EdgeInsets.only(left: 55.0, top: 20),
                      child: Text(
                        "Today You have Bank Loan Payment",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ]))),
      if (insuranceDay == day)
        Center(
            child: Container(
                width: 850,
                height: 55,
                margin: const EdgeInsets.only(
                    left: 10.0, right: 10.0, bottom: 10.0),
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 236, 246, 255),
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                        color: const Color.fromARGB(255, 143, 166, 235),
                        width: 2.0)),
                padding: const EdgeInsets.only(left: 0.0, right: 10.0),
                child: Stack(children: <Widget>[
                  SizedBox(
                      height: 45,
                      width: 45,
                      child: Image.asset(
                        'assests/images/insurance.png',
                        fit: BoxFit.cover,
                      )),
                  const Padding(
                      padding: EdgeInsets.only(left: 55.0, top: 20),
                      child: Text(
                        "Today You have Insurance Payment",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ]))),
      if (waterDay == day)
        Center(
            child: Container(
                width: 850,
                height: 55,
                margin: const EdgeInsets.only(
                    left: 10.0, right: 10.0, bottom: 10.0),
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 236, 246, 255),
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                        color: const Color.fromARGB(255, 143, 166, 235),
                        width: 2.0)),
                padding:
                    const EdgeInsets.only(left: 0.0, right: 10.0, top: 2.0),
                child: Stack(children: <Widget>[
                  SizedBox(
                      height: 45,
                      width: 45,
                      child: Image.asset(
                        'assests/images/water-tap.png',
                        fit: BoxFit.cover,
                      )),
                  const Padding(
                      padding: EdgeInsets.only(left: 55.0, top: 20),
                      child: Text(
                        "Today You have Water Payment",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ]))),
      if (internetDay == day)
        Center(
            child: Container(
                width: 850,
                height: 55,
                margin: const EdgeInsets.only(
                    left: 10.0, right: 10.0, bottom: 10.0),
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 236, 246, 255),
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                        color: const Color.fromARGB(255, 143, 166, 235),
                        width: 2.0)),
                padding:
                    const EdgeInsets.only(left: 0.0, right: 10.0, top: 2.0),
                child: Stack(children: <Widget>[
                  SizedBox(
                      height: 45,
                      width: 45,
                      child: Image.asset(
                        'assests/images/internet.png',
                        fit: BoxFit.cover,
                      )),
                  const Padding(
                      padding: EdgeInsets.only(left: 55.0, top: 20),
                      child: Text(
                        "Today you have Internet Payment",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ]))),
      if (otherDay == day)
        Center(
            child: Container(
                width: 850,
                height: 55,
                margin: const EdgeInsets.only(
                    left: 10.0, right: 10.0, bottom: 10.0),
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 236, 246, 255),
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                        color: const Color.fromARGB(255, 143, 166, 235),
                        width: 2.0)),
                padding:
                    const EdgeInsets.only(left: 0.0, right: 10.0, top: 2.0),
                child: Stack(children: <Widget>[
                  SizedBox(
                      height: 45,
                      width: 45,
                      child: Image.asset(
                        'assests/images/grocery-cart.png',
                        fit: BoxFit.cover,
                      )),
                  const Padding(
                      padding: EdgeInsets.only(left: 55.0, top: 20),
                      child: Text(
                        "Today You have other Payment",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ])))
      else if (foodDay != day &&
          electricityDay != day &&
          loanDay != day &&
          insuranceDay != day &&
          waterDay != day &&
          insuranceDay != day &&
          otherDay != day)
        Message(type: 'Today You haven\'t Payment'),
    ]));
    ;
  }

  getMonth() async {
    final prefs = await SharedPreferences.getInstance();
    var db = FirebaseFirestore.instance;
    var now = new DateTime.now();
    String day = ('${now.day}');
    String getmonth = ('${now.month}');
    if (getmonth.length != 2) {
      getmonth = "0" + getmonth;
    }
    final food =
        db.collection("month").doc(prefs.getString('userEmail').toString());
    food.get().then(
      (DocumentSnapshot doc) {
        if (doc.data() != null) {
          final data = doc.data() as Map<String, dynamic>;
          print(data);

          if (data['number'] != getmonth) {
            setState(() {
              status = false;
            });
            return showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Alert(type: ' Please add new budget for this month');
                });
          }
        }
      },
      onError: (e) => print("Error getting document: $e"),
    );
  }

  getData() async {
    final prefs = await SharedPreferences.getInstance();
    var db = FirebaseFirestore.instance;

    var now = new DateTime.now();
    String day = ('${now.day}');
    String getmonth = ('${now.month}');
    String month = "";
    if (getmonth.length != 2) {
      getmonth = "0" + getmonth;
    }
    if (getmonth.length == 1) {}
    final monthData = await db
        .collection("month")
        .doc(prefs.getString('userEmail').toString());
    monthData.get().then(
      (DocumentSnapshot doc) {
        if (doc.data() != null) {
          final data = doc.data() as Map<String, dynamic>;
          print(data);
          setState(() {
            month = data['number'];
          });
        }
      },
      onError: (e) => print("Error getting document: $e"),
    );

    final foodData = await db
        .collection("Food")
        .doc(prefs.getString('userEmail').toString());
    foodData.get().then(
      (DocumentSnapshot doc) {
        if (doc.data() != null) {
          final data = doc.data() as Map<String, dynamic>;
          print(data);
          setState(() {
            foodPrice = data['price'];
            foodDay = data['day'];
          });
        }
      },
      onError: (e) => print("Error getting document: $e"),
    );
    final ElectricityData = await db
        .collection("Electricity")
        .doc(prefs.getString('userEmail').toString());
    ElectricityData.get().then(
      (DocumentSnapshot doc) {
        if (doc.data() != null) {
          final data = doc.data() as Map<String, dynamic>;
          setState(() {
            electricityPrice = data['price'];
            electricityDay = data['day'];
          });
        }
      },
      onError: (e) => print("Error getting document: $e"),
    );

    final LoanData = await db
        .collection("Loan")
        .doc(prefs.getString('userEmail').toString());
    LoanData.get().then(
      (DocumentSnapshot doc) {
        if (doc.data() != null) {
          final data = doc.data() as Map<String, dynamic>;
          setState(() {
            loanPrice = data['price'];
            loanDay = data['day'];
          });
        }
      },
      onError: (e) => print("Error getting document: $e"),
    );

    final InsuranceData = await db
        .collection("Insurance")
        .doc(prefs.getString('userEmail').toString());
    InsuranceData.get().then(
      (DocumentSnapshot doc) {
        if (doc.data() != null) {
          final data = doc.data() as Map<String, dynamic>;
          setState(() {
            insurancePrice = data['price'];
            insuranceDay = data['day'];
          });
        }
      },
      onError: (e) => print("Error getting document: $e"),
    );

    final WaterData = await db
        .collection("Water")
        .doc(prefs.getString('userEmail').toString());
    WaterData.get().then(
      (DocumentSnapshot doc) {
        if (doc.data() != null) {
          final data = doc.data() as Map<String, dynamic>;
          setState(() {
            waterPrice = data['price'];
            waterDay = data['day'];
          });
        }
      },
      onError: (e) => print("Error getting document: $e"),
    );

    final InternetData = await db
        .collection("Internet")
        .doc(prefs.getString('userEmail').toString());
    InternetData.get().then(
      (DocumentSnapshot doc) {
        if (doc.data() != null) {
          final data = doc.data() as Map<String, dynamic>;
          setState(() {
            insurancePrice = data['price'];
            internetDay = data['day'];
          });
        }
      },
      onError: (e) => print("Error getting document: $e"),
    );

    final OthersData = await db
        .collection("Others")
        .doc(prefs.getString('userEmail').toString());
    OthersData.get().then(
      (DocumentSnapshot doc) {
        if (doc.data() != null) {
          final data = doc.data() as Map<String, dynamic>;
          setState(() {
            otherPrice = data['price'];
            otherDay = data['day'];
          });
        }
      },
      onError: (e) => print("Error getting document: $e"),
    );
  }
}
