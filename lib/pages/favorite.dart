import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled2/pages/popUpmessages.dart';
import 'addBudget.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  String Food = 'false';
  String Electricity = 'false';
  String Loan = 'false';
  String Insurance = 'false';
  String Water = 'false';
  String Internet = 'false';
  String Others = 'false';
  void initState() {
    super.initState();
    getFavorite();
  }

  @override
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
      if (Food == "true")
        InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return addBudget(type: 'Food');
                  });
            },
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
                    const EdgeInsets.only(left: 55.0, right: 10.0, top: 2.0),
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
                        left: 100.0,
                        top: 20,
                      ),
                      child: Text(
                        "Food & Drinks",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ]))),
      if (Electricity == 'true')
        InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return addBudget(type: 'Electricity');
                  });
            },
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
                    const EdgeInsets.only(left: 55.0, right: 10.0, top: 2.0),
                child: Stack(children: <Widget>[
                  SizedBox(
                      height: 45,
                      width: 45,
                      child: Image.asset(
                        'assests/images/electricity.png',
                        fit: BoxFit.cover,
                      )),
                  const Padding(
                      padding: EdgeInsets.only(left: 100.0, top: 20),
                      child: Text(
                        "Electricity Payament",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ]))),
      if (Loan == 'true')
        InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return addBudget(type: 'Loan');
                  });
            },
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
                    const EdgeInsets.only(left: 55.0, right: 10.0, top: 2.0),
                child: Stack(children: <Widget>[
                  SizedBox(
                      height: 45,
                      width: 45,
                      child: Image.asset(
                        'assests/images/loan.png',
                        fit: BoxFit.cover,
                      )),
                  const Padding(
                      padding: EdgeInsets.only(left: 100.0, top: 20),
                      child: Text(
                        "Bank Loan",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ]))),
      if (Insurance == 'true')
        InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return addBudget(type: 'Insurance');
                  });
            },
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
                padding: const EdgeInsets.only(left: 55.0, right: 10.0),
                child: Stack(children: <Widget>[
                  SizedBox(
                      height: 45,
                      width: 45,
                      child: Image.asset(
                        'assests/images/insurance.png',
                        fit: BoxFit.cover,
                      )),
                  const Padding(
                      padding: EdgeInsets.only(left: 100.0, top: 20),
                      child: Text(
                        "Insurance",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ]))),
      if (Water == 'true')
        InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return addBudget(type: 'Water');
                  });
            },
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
                    const EdgeInsets.only(left: 55.0, right: 10.0, top: 2.0),
                child: Stack(children: <Widget>[
                  SizedBox(
                      height: 45,
                      width: 45,
                      child: Image.asset(
                        'assests/images/water-tap.png',
                        fit: BoxFit.cover,
                      )),
                  const Padding(
                      padding: EdgeInsets.only(left: 100.0, top: 20),
                      child: Text(
                        "Water",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ]))),
      if (Internet == 'true')
        InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return addBudget(type: 'Internet');
                  });
            },
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
                    const EdgeInsets.only(left: 55.0, right: 10.0, top: 2.0),
                child: Stack(children: <Widget>[
                  SizedBox(
                      height: 45,
                      width: 45,
                      child: Image.asset(
                        'assests/images/internet.png',
                        fit: BoxFit.cover,
                      )),
                  const Padding(
                      padding: EdgeInsets.only(left: 100.0, top: 20),
                      child: Text(
                        "Internet",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ]))),
      if (Others == 'true')
        InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return addBudget(type: 'Others');
                  });
            },
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
                    const EdgeInsets.only(left: 55.0, right: 10.0, top: 2.0),
                child: Stack(children: <Widget>[
                  SizedBox(
                      height: 45,
                      width: 45,
                      child: Image.asset(
                        'assests/images/grocery-cart.png',
                        fit: BoxFit.cover,
                      )),
                  const Padding(
                      padding: EdgeInsets.only(left: 100.0, top: 20),
                      child: Text(
                        "Other Payement",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ])))
      else if (Food != "true" &&
          Electricity != "true" &&
          Loan != "true" &&
          Insurance != "true" &&
          Water != "true" &&
          Insurance != "true" &&
          Others != "true")
        Message(type: 'You haven\'t added Favorite')
    ]));

    ;
  }

  getlastMonth() {}

  getFavorite() async {
    final prefs = await SharedPreferences.getInstance();
    var db = FirebaseFirestore.instance;

    final foodData =
        db.collection("Favourite").doc(prefs.getString('userEmail').toString());
    foodData.get().then(
      (DocumentSnapshot doc) {
        if (doc.data() != null) {
          final data = doc.data() as Map<String, dynamic>;
          print(data);
          setState(() {
            Food = data['Food'];
          });
        }
      },
      onError: (e) => print("Error getting document: $e"),
    );

    final ElectricityData =
        db.collection("Favourite").doc(prefs.getString('userEmail').toString());
    ElectricityData.get().then(
      (DocumentSnapshot doc) {
        if (doc.data() != null) {
          final data = doc.data() as Map<String, dynamic>;
          setState(() {
            Electricity = data['Electricity'];
          });
        }
      },
      onError: (e) => print("Error getting document: $e"),
    );

    final LoanData =
        db.collection("Favourite").doc(prefs.getString('userEmail').toString());
    LoanData.get().then(
      (DocumentSnapshot doc) {
        if (doc.data() != null) {
          final data = doc.data() as Map<String, dynamic>;
          setState(() {
            Loan = data['Loan'];
          });
        }
      },
      onError: (e) => print("Error getting document: $e"),
    );

    final InsuranceData =
        db.collection("Favourite").doc(prefs.getString('userEmail').toString());
    InsuranceData.get().then(
      (DocumentSnapshot doc) {
        if (doc.data() != null) {
          final data = doc.data() as Map<String, dynamic>;
          setState(() {
            Insurance = data['Insurance'];
          });
        }
      },
      onError: (e) => print("Error getting document: $e"),
    );

    final WaterData =
        db.collection("Favourite").doc(prefs.getString('userEmail').toString());
    WaterData.get().then(
      (DocumentSnapshot doc) {
        if (doc.data() != null) {
          final data = doc.data() as Map<String, dynamic>;
          setState(() {
            Water = data['Water'];
          });
        }
      },
      onError: (e) => print("Error getting document: $e"),
    );

    final InternetData =
        db.collection("Favourite").doc(prefs.getString('userEmail').toString());
    InternetData.get().then(
      (DocumentSnapshot doc) {
        if (doc.data() != null) {
          final data = doc.data() as Map<String, dynamic>;
          setState(() {
            Internet = data['Internet'];
          });
        }
      },
      onError: (e) => print("Error getting document: $e"),
    );

    final OthersData =
        db.collection("Favourite").doc(prefs.getString('userEmail').toString());
    OthersData.get().then(
      (DocumentSnapshot doc) {
        if (doc.data() != null) {
          final data = doc.data() as Map<String, dynamic>;
          setState(() {
            Others = data['Others'];
          });
        }
      },
      onError: (e) => print("Error getting document: $e"),
    );
  }
}
