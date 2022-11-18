import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'favorite.dart';
import 'home.dart';
import 'badget.dart';
import 'notifications.dart';
import 'signIn.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  // static const TextStyle optionStyle = TextStyle(fontWeight: FontWeight.bold);
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    Budget(),
    Favorite(),
    Notifications(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Color.fromARGB(255, 27, 103, 170),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_outlined),
            label: 'Budget',
            backgroundColor: Color.fromARGB(255, 27, 103, 170),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'favorite',
            backgroundColor: Color.fromARGB(255, 27, 103, 170),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification',
            backgroundColor: Color.fromARGB(255, 27, 103, 170),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 2, 1, 10),
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return const LogOut();
              });
        },
        child: const Icon(Icons.login),
      ),
    );
  }
}

class LogOut extends StatefulWidget {
  const LogOut({super.key});

  @override
  State<LogOut> createState() => _LogOutState();
}

class _LogOutState extends State<LogOut> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: AlertDialog(
        scrollable: true,
        content: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                    height: 80,
                    width: 55,
                    child: Image.asset(
                      'assests/images/warning.png',
                      fit: BoxFit.cover,
                    )),
                Container(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: const Text(
                      'Are You Login Out',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        // fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 20,
                      ),
                    )),
                Container(
                  padding:
                      new EdgeInsets.only(top: 20.0, bottom: 10.0, left: 3.0),
                  child: ElevatedButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                      call;
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignIn()),
                      );
                    },
                    child: const Text('Okay'),
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
              ],
            )),
      ),
    );
  }

  call() async {
    final prefs = await SharedPreferences.getInstance();

    prefs.remove('userEmail');
    prefs.clear();
  }
}
