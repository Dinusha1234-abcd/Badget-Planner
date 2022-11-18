import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled2/pages/badget.dart';
import 'package:untitled2/pages/uncessfulMessage.dart';

import 'sucessfulMessage.dart';

class addBudget extends StatefulWidget {
  const addBudget({Key? key, required this.type}) : super(key: key);
  final String type;
  @override
  State<addBudget> createState() => _addBudgetState();
}

class _addBudgetState extends State<addBudget> {
  void initState() {
    super.initState();
    getFavorite();
    getData();
    getUpdate();
  }

  String month = "";

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

  String Food = 'false';
  String Electricity = 'false';
  String Loan = 'false';
  String Insurance = 'false';
  String Water = 'false';
  String Internet = 'false';
  String Others = 'false';

  bool status = true;

  final myController = TextEditingController();

  TextEditingController _price = TextEditingController();
  TextEditingController _date = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final type = widget.type;
    return AlertDialog(
      scrollable: true,
      title: Text('${widget.type}'),
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _price,
                decoration: const InputDecoration(
                  labelText: 'Price',
                  icon: Icon(Icons.money),
                ),
              ),
              TextFormField(
                  controller: _date,
                  decoration: InputDecoration(
                      icon: Icon(Icons.calendar_today), //icon of text field
                      labelText: "Enter Date" //label text of field
                      ),
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2100));

                    if (pickedDate != null) {
                      print(
                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      print(
                          formattedDate); //formatted date output using intl package =>  2021-03-16
                      setState(() {
                        _date.text =
                            formattedDate; //set output date to TextField value.
                      });
                    }
                    const InputDecoration(
                      labelText: 'Reminder Date',
                      icon: Icon(Icons.date_range_outlined),
                    );
                  }),
              Container(
                padding:
                    new EdgeInsets.only(top: 20.0, bottom: 10.0, left: 3.0),
                child: ElevatedButton(
                  onPressed: () {
                    add();
                  },
                  child: const Text('Add'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 27, 29, 175),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 10),
                      textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      shape: StadiumBorder()),
                ),
              ),
              if ((widget.type == 'Food' && Food == 'true') ||
                  (widget.type == 'Loan' && Loan == 'true') ||
                  (widget.type == 'Electricity' && Electricity == 'true') ||
                  (widget.type == 'Insurance' && Insurance == 'true') ||
                  (widget.type == 'Water' && Water == 'true') ||
                  (widget.type == 'Internet' && Internet == 'true') ||
                  (widget.type == 'Others' && Others == 'true'))
                Container(
                  padding:
                      new EdgeInsets.only(top: 20.0, bottom: 10.0, left: 3.0),
                  child: ElevatedButton(
                    onPressed: () {
                      remove();
                    },
                    child: const Text('Remove Favourite'),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 137, 114, 12),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 10),
                        textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        shape: StadiumBorder()),
                  ),
                ),
              if ((widget.type == 'Food' && Food == 'false') ||
                  (widget.type == 'Loan' && Loan == 'false') ||
                  (widget.type == 'Electricity' && Electricity == 'false') ||
                  (widget.type == 'Insurance' && Insurance == 'false') ||
                  (widget.type == 'Water' && Water == 'false') ||
                  (widget.type == 'Internet' && Internet == 'false') ||
                  (widget.type == 'Others' && Others == 'false'))
                Container(
                  padding:
                      new EdgeInsets.only(top: 20.0, bottom: 10.0, left: 3.0),
                  child: ElevatedButton(
                    onPressed: () {
                      addFavorite();
                    },
                    child: const Text('Add Favourite'),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 137, 114, 12),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 10),
                        textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        shape: StadiumBorder()),
                  ),
                ),
            ],
          ),
        ),
      ),
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
    final food =
        db.collection("month").doc(prefs.getString('userEmail').toString());
    food.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        print(data);

        if (data['number'] != getmonth) {
          setState(() {
            status = false;
          });
          return showDialog(
              context: context,
              builder: (BuildContext context) {
                return UnscucessFulMessage(
                    type: ' Please add new payemnt for this month');
              });
        }
      },
      onError: (e) => print("Error getting document: $e"),
    );
  }

  getUpdate() {
    if (widget.type == 'Food') {
      _price.text = foodPrice;
    }
  }

  getData() async {
    final prefs = await SharedPreferences.getInstance();
    var db = FirebaseFirestore.instance;

    if (status == true) {
      final foodData = await db
          .collection("Food")
          .doc(prefs.getString('userEmail').toString());
      foodData.get().then(
        (DocumentSnapshot doc) {
          final data = doc.data() as Map<String, dynamic>;
          print(data);
          setState(() {
            foodPrice = data['price'];
            foodDay = data['day'];
          });
        },
        onError: (e) => print("Error getting document: $e"),
      );
      final ElectricityData = await db
          .collection("Electricity")
          .doc(prefs.getString('userEmail').toString());
      ElectricityData.get().then(
        (DocumentSnapshot doc) {
          final data = doc.data() as Map<String, dynamic>;
          setState(() {
            electricityPrice = data['price'];
            electricityDay = data['day'];
          });
        },
        onError: (e) => print("Error getting document: $e"),
      );

      final LoanData = await db
          .collection("Loan")
          .doc(prefs.getString('userEmail').toString());
      LoanData.get().then(
        (DocumentSnapshot doc) {
          final data = doc.data() as Map<String, dynamic>;
          setState(() {
            loanPrice = data['price'];
            loanPrice = data['day'];
          });
        },
        onError: (e) => print("Error getting document: $e"),
      );

      final InsuranceData = await db
          .collection("Insurance")
          .doc(prefs.getString('userEmail').toString());
      InsuranceData.get().then(
        (DocumentSnapshot doc) {
          final data = doc.data() as Map<String, dynamic>;
          setState(() {
            insurancePrice = data['price'];
            insuranceDay = data['day'];
          });
        },
        onError: (e) => print("Error getting document: $e"),
      );

      final WaterData = await db
          .collection("Water")
          .doc(prefs.getString('userEmail').toString());
      WaterData.get().then(
        (DocumentSnapshot doc) {
          final data = doc.data() as Map<String, dynamic>;
          setState(() {
            waterPrice = data['price'];
            waterDay = data['day'];
          });
        },
        onError: (e) => print("Error getting document: $e"),
      );

      final InternetData = await db
          .collection("Internet")
          .doc(prefs.getString('userEmail').toString());
      InternetData.get().then(
        (DocumentSnapshot doc) {
          final data = doc.data() as Map<String, dynamic>;
          setState(() {
            insurancePrice = data['price'];
            internetDay = data['day'];
          });
        },
        onError: (e) => print("Error getting document: $e"),
      );

      final OthersData = await db
          .collection("Favourite")
          .doc(prefs.getString('userEmail').toString());
      OthersData.get().then(
        (DocumentSnapshot doc) {
          final data = doc.data() as Map<String, dynamic>;
          setState(() {
            Others = data['Others'];
          });
        },
        onError: (e) => print("Error getting document: $e"),
      );
    }
  }

  remove() async {
    var type = widget.type;

    if (type == 'Food') {
      setState(() {
        Food = 'false';
      });
    } else if (type == 'Electricity') {
      setState(() {
        Electricity = 'false';
      });
    } else if (type == 'Insurance') {
      setState(() {
        Insurance = 'false';
      });
    } else if (type == 'Water') {
      setState(() {
        Water = 'false';
      });
    } else if (type == 'Internet') {
      setState(() {
        Internet = 'false';
      });
    } else if (type == 'Loan') {
      setState(() {
        Loan = 'false';
      });
    } else {
      setState(() {
        Others = 'false';
      });
    }

    var db = FirebaseFirestore.instance;
    final prefs = await SharedPreferences.getInstance();
    final budget = <String, String>{
      'Food': Food,
      'Electricity': Electricity,
      'Loan': Loan,
      'Insurance': Insurance,
      'Water': Water,
      'Internet': Internet,
      'Others': Others
    };

    db
        .collection('Favourite')
        .doc(prefs.getString('userEmail').toString())
        .set(budget);
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SucessFulMessage(
              type: widget.type + ' Favourite remove Sucessfully');
        });
  }

  getFavorite() async {
    final prefs = await SharedPreferences.getInstance();
    var db = FirebaseFirestore.instance;

    final foodData = await db
        .collection("Favourite")
        .doc(prefs.getString('userEmail').toString());
    foodData.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        print(data);
        setState(() {
          Food = data['Food'];
        });
      },
      onError: (e) => print("Error getting document: $e"),
    );
    final ElectricityData = await db
        .collection("Favourite")
        .doc(prefs.getString('userEmail').toString());
    ElectricityData.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        setState(() {
          Electricity = data['Electricity'];
        });
      },
      onError: (e) => print("Error getting document: $e"),
    );

    final LoanData = await db
        .collection("Favourite")
        .doc(prefs.getString('userEmail').toString());
    LoanData.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        setState(() {
          Loan = data['Loan'];
        });
      },
      onError: (e) => print("Error getting document: $e"),
    );

    final InsuranceData = await db
        .collection("Favourite")
        .doc(prefs.getString('userEmail').toString());
    InsuranceData.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        setState(() {
          Insurance = data['Insurance'];
        });
      },
      onError: (e) => print("Error getting document: $e"),
    );

    final WaterData = await db
        .collection("Favourite")
        .doc(prefs.getString('userEmail').toString());
    WaterData.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        setState(() {
          Water = data['Water'];
        });
      },
      onError: (e) => print("Error getting document: $e"),
    );

    final InternetData = await db
        .collection("Favourite")
        .doc(prefs.getString('userEmail').toString());
    InternetData.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        setState(() {
          Internet = data['Internet'];
        });
      },
      onError: (e) => print("Error getting document: $e"),
    );

    final OthersData = await db
        .collection("Favourite")
        .doc(prefs.getString('userEmail').toString());
    OthersData.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        setState(() {
          Others = data['Others'];
        });
      },
      onError: (e) => print("Error getting document: $e"),
    );
  }

  addFavorite() async {
    var type = widget.type;

    if (type == 'Food') {
      setState(() {
        Food = 'true';
      });
    } else if (type == 'Electricity') {
      setState(() {
        Electricity = 'true';
      });
    } else if (type == 'Insurance') {
      setState(() {
        Insurance = 'true';
      });
    } else if (type == 'Water') {
      setState(() {
        Water = 'true';
      });
    } else if (type == 'Internet') {
      setState(() {
        Internet = 'true';
      });
    } else if (type == 'Loan') {
      setState(() {
        Loan = 'true';
      });
    } else {
      setState(() {
        Others = 'true';
      });
    }

    var db = FirebaseFirestore.instance;
    final prefs = await SharedPreferences.getInstance();
    final budget = <String, String>{
      'Food': Food,
      'Electricity': Electricity,
      'Loan': Loan,
      'Insurance': Insurance,
      'Water': Water,
      'Internet': Internet,
      'Others': Others
    };

    db
        .collection('Favourite')
        .doc(prefs.getString('userEmail').toString())
        .set(budget);
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SucessFulMessage(
              type: widget.type + ' Favourite added Sucessfully');
        });
  }

  add() async {
    print('call');

    var now = new DateTime.now();
    String day = ('${now.day}');
    String getmonth = ('${now.month}');
    if (getmonth.length != 2) {
      getmonth = "0" + getmonth;
    }
    print(_date.text.substring(8));
    if (!(_date.text.isEmpty) && !(_date.text.isEmpty)) {
      var db = FirebaseFirestore.instance;
      final prefs = await SharedPreferences.getInstance();
      final budget = <String, String>{
        "day": _date.text.substring(8),
        "price": _price.text,
        "month": getmonth.toString()
      };
      final month = <String, String>{
        "number": getmonth.toString(),
      };

      db
          .collection(widget.type)
          .doc(prefs.getString('userEmail').toString())
          .set(budget);
      db
          .collection('month')
          .doc(prefs.getString('userEmail').toString())
          .set(month);
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return SucessFulMessage(type: widget.type + ' added Sucessfully');
          });
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return UnscucessFulMessage(type: "Input Field are Empty");
          });
    }
  }
}
