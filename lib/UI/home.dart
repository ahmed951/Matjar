import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:matjar_login_signup/UI/signUp.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_database/firebase_database.dart';

//import 'package:matjar_login_signup/Classes/user.dart';

var mainColor = Colors.red[700];
var white = Colors.white;

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  String _email = '';
  String _uid = '';

  void initState() {
    super.initState();
    _email = FirebaseAuth.instance.currentUser.email;
    _uid = FirebaseAuth.instance.currentUser.uid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: Text(
          "Matjar",
          style: TextStyle(
            fontSize: 30,
            fontFamily: "DancingScript",
          ),
        ),
        backgroundColor: mainColor,
        toolbarHeight: 80,
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red, // <----------------
        unselectedItemColor: mainColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: white,
        iconSize: 30,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_sharp),
            label: "",
          ),
        ],
        /* onTap: (int x) => (x == 0)
              ? print("index 0 : go to fiter page")
              : print("not avilable now"), */
      ),
      body: Container(
        child: Column(
          children: [
            Text("Welcome $_email your id is $_uid"),
            SizedBox(
              height: 15,
            ),
            FlatButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut().then((value) {
                  Navigator.of(context).pushNamed('/Login');
                });
              },
              child: Text("Sign Out"),
            )
          ],
        ),
      ),
    );
  }
}
