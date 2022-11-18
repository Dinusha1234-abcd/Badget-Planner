import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled2/pages/alert.dart';
import 'package:untitled2/pages/sucessfulMessage.dart';
import 'package:untitled2/pages/uncessfulMessage.dart';
import 'package:untitled2/pages/welcome.dart';
import 'menu.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String foodPrice = "0";
  String electricityPrice = "0";
  String loanPrice = "0";
  String insurancePrice = "0";
  String waterPrice = "0";
  String internetPrice = "0";
  String otherPrice = "0";
  String Month = "0";
  bool status = true;
  @override
  void initState() {
    super.initState();

    getMonth();
    call();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, double> dataMap = {
      "Food": double.parse(foodPrice),
      "Electricity Bill": double.parse(electricityPrice),
      "Bank Loan": double.parse(loanPrice),
      "Insurance": double.parse(insurancePrice),
      "Water Bill": double.parse(waterPrice),
      "Internet": double.parse(internetPrice),
      "Others": double.parse(otherPrice),
    };

    return SingleChildScrollView(
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
        Container(
          width: 850,
          height: 250,
          margin: const EdgeInsets.all(20),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 236, 246, 255),
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(
                  color: const Color.fromARGB(255, 143, 166, 235), width: 2.0)),
          padding: const EdgeInsets.only(
              top: 20.0, bottom: 10.0, left: 30.0, right: 30.0),
          // color: Color.fromARGB(255, 210, 210, 210),
          child: Column(children: <Widget>[
            const Text('Monthly Budget Planing',
                style: TextStyle(
                  color: Color.fromARGB(255, 38, 16, 16),
                  fontSize: 24,
                  // fontWeight: FontWeight.bold,
                )),
            PieChart(
              dataMap: dataMap,
              totalValue: null,
              chartType: ChartType.ring,
              chartValuesOptions: const ChartValuesOptions(
                showChartValueBackground: true,
                showChartValues: false,
                showChartValuesInPercentage: false,
                showChartValuesOutside: false,
                decimalPlaces: 1,
              ),
              legendOptions: const LegendOptions(
                  showLegendsInRow: false,
                  legendPosition: LegendPosition.right,
                  showLegends: true,
                  legendTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
            )
          ]),
        ),
        Row(children: <Widget>[
          Container(
              width: 150,
              height: 120,
              margin:
                  const EdgeInsets.only(left: 34.0, right: 10.0, bottom: 10.0),
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
                    padding: EdgeInsets.all(0),
                    child: Text(
                      "Food & Drinks",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                Padding(
                    padding: EdgeInsets.all(0), child: Text("Rs " + foodPrice)),
              ])),
          Container(
              width: 150,
              height: 120,
              margin:
                  const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
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
                    padding: EdgeInsets.all(0),
                    child: Text(
                      "Electricity Bill",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                Padding(
                    padding: EdgeInsets.all(0),
                    child: Text("Rs " + electricityPrice)),
              ])),
        ]),
        Row(children: <Widget>[
          Container(
              width: 150,
              height: 120,
              margin:
                  const EdgeInsets.only(left: 34.0, right: 10.0, bottom: 10.0),
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
                    padding: EdgeInsets.all(0),
                    child: Text(
                      "Bank Loan",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                Padding(
                    padding: EdgeInsets.all(0), child: Text("Rs " + loanPrice)),
              ])),
          Container(
              width: 150,
              height: 120,
              margin:
                  const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
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
                    padding: EdgeInsets.all(0),
                    child: Text(
                      "Insurance",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                Padding(
                    padding: EdgeInsets.all(0),
                    child: Text("Rs " + insurancePrice)),
              ])),
        ]),
        Row(children: <Widget>[
          Container(
              width: 150,
              height: 120,
              margin:
                  const EdgeInsets.only(left: 34.0, right: 10.0, bottom: 10.0),
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
                    padding: EdgeInsets.all(0),
                    child: Text(
                      "Water Bill",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                Padding(
                    padding: EdgeInsets.all(0),
                    child: Text("Rs " + waterPrice)),
              ])),
          Container(
              width: 150,
              height: 120,
              margin:
                  const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
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
                    padding: EdgeInsets.all(0),
                    child: Text(
                      "Internet",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                Padding(
                    padding: EdgeInsets.all(0),
                    child: Text("Rs " + internetPrice)),
              ])),
        ]),
        Row(children: <Widget>[
          Container(
              width: 150,
              height: 120,
              margin:
                  const EdgeInsets.only(left: 34.0, right: 10.0, bottom: 10.0),
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
                    padding: EdgeInsets.all(0),
                    child: Text(
                      "Others",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                Padding(
                    padding: EdgeInsets.all(0),
                    child: Text("Rs " + otherPrice)),
              ])),
        ]),
      ]),
    );
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

    final monthdata =
        db.collection("month").doc(prefs.getString('userEmail').toString());
    monthdata.get().then(
      (DocumentSnapshot doc) {
        if (doc.data() != null) {
          final data = doc.data() as Map<String, dynamic>;
          print(data['number'].toString().isEmpty);
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
        } else {
          return showDialog(
              context: context,
              builder: (BuildContext context) {
                return Welcome(type: 'Please add new budget for this month');
              });
        }
      },
      onError: (e) => print("Error getting document: $e"),
    );
  }

  call() async {
    final prefs = await SharedPreferences.getInstance();
    var now = new DateTime.now();
    String day = ('${now.day}');
    String getmonth = ('${now.month}');
    if (getmonth.length != 2) {
      getmonth = "0" + getmonth;
    }
    var db = FirebaseFirestore.instance;
    print("name" + prefs.getString('userEmail').toString());
    final food =
        db.collection("Food").doc(prefs.getString('userEmail').toString());
    food.get().then(
      (DocumentSnapshot doc) {
        if (doc.data() != null) {
          final data = doc.data() as Map<String, dynamic>;
          if (data['month'] == getmonth) {
            setState(() {
              foodPrice = data['price'];
            });
          }
        }
      },
      onError: (e) => print("Error getting document: $e"),
    );

    final Electricity = db
        .collection("Electricity")
        .doc(prefs.getString('userEmail').toString());
    Electricity.get().then(
      (DocumentSnapshot doc) {
        if (doc.data() != null) {
          final data = doc.data() as Map<String, dynamic>;
          if (data['month'] == getmonth) {
            setState(() {
              electricityPrice = data['price'];
            });
          }
        }
      },
      onError: (e) => print("Error getting document: $e"),
    );

    final Loan =
        db.collection("Loan").doc(prefs.getString('userEmail').toString());
    Loan.get().then(
      (DocumentSnapshot doc) {
        if (doc.data() != null) {
          final data = doc.data() as Map<String, dynamic>;
          if (data['month'] == getmonth) {
            setState(() {
              loanPrice = data['price'];
            });
          }
        }
      },
      onError: (e) => print("Error getting document: $e"),
    );

    final Insurance =
        db.collection("Insurance").doc(prefs.getString('userEmail').toString());
    Insurance.get().then(
      (DocumentSnapshot doc) {
        if (doc.data() != null) {
          final data = doc.data() as Map<String, dynamic>;
          if (data['month'] == getmonth) {
            setState(() {
              insurancePrice = data['price'];
            });
          }
        }
      },
      onError: (e) => print("Error getting document: $e"),
    );

    final Water =
        db.collection("Water").doc(prefs.getString('userEmail').toString());
    Water.get().then(
      (DocumentSnapshot doc) {
        if (doc.data() != null) {
          final data = doc.data() as Map<String, dynamic>;
          if (data['month'] == getmonth) {
            setState(() {
              waterPrice = data['price'];
            });
          }
        }
      },
      onError: (e) => print("Error getting document: $e"),
    );

    final Internet =
        db.collection("Internet").doc(prefs.getString('userEmail').toString());
    Internet.get().then(
      (DocumentSnapshot doc) {
        if (doc.data() != null) {
          final data = doc.data() as Map<String, dynamic>;
          if (data['month'] == getmonth) {
            setState(() {
              internetPrice = data['price'];
            });
          }
        }
      },
      onError: (e) => print("Error getting document: $e"),
    );

    final Others =
        db.collection("Others").doc(prefs.getString('userEmail').toString());
    Others.get().then(
      (DocumentSnapshot doc) {
        if (doc.data() != null) {
          final data = doc.data() as Map<String, dynamic>;
          if (data['month'] == getmonth) {
            setState(() {
              otherPrice = data['price'];
            });
          }
        }
      },
      onError: (e) => print("Error getting document: $e"),
    );
  }
}
