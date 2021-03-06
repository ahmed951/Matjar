import 'package:flutter/material.dart';
import 'package:matjar_login_signup/auth/auth.dart';
import 'matjar_icons1.dart';
import 'matjar_icons.dart';
import 'constants.dart';

class SignUpSeller extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _SignUpSeller();
  }
}

class _SignUpSeller extends State<SignUpSeller> {
  int currentIndex = 3;
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Matjar",
          style: TextStyle(
            fontSize: 40,
            fontFamily: "DancingScript",
          ),
        ),
        backgroundColor: mainColor,
        toolbarHeight: 80,
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        currentIndex: currentIndex,
        backgroundColor: Colors.white,
        selectedFontSize: 13,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Matjar.home,
              color: Color.fromRGBO(255, 0, 0, 1),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Matjar.categories,
              color: Color.fromRGBO(255, 0, 0, 1),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Matjar.cart,
              color: Color.fromRGBO(255, 0, 0, 1),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Matjar.sign_in_and_sign_up_logo,
              color: Color.fromRGBO(255, 0, 0, 1),
            ),
            label: "",
          ),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: new Container(
        margin: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
        padding: new EdgeInsets.all(30),
        width: 380,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(0, 3),
          )
        ]),
        child: new ListView(
          children: [
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new Padding(padding: EdgeInsets.all(10)),
                new Text('Create Your Seller Account',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(255, 0, 0, 10),
                    )),
                new Padding(padding: EdgeInsets.all(10)),
                new TextField(
                  controller: _firstNameController,
                  decoration: new InputDecoration(
                      labelText: 'First Name', border: OutlineInputBorder()),
                ),
                new Padding(padding: EdgeInsets.all(10)),
                new TextField(
                  controller: _lastNameController,
                  decoration: new InputDecoration(
                      labelText: 'Last Name', border: OutlineInputBorder()),
                ),
                new Padding(padding: EdgeInsets.all(10)),
                new TextField(
                  controller: _emailController,
                  decoration: new InputDecoration(
                      labelText: 'Email', border: OutlineInputBorder()),
                ),
                new Padding(padding: EdgeInsets.all(10)),
                new TextField(
                  obscureText: true,
                  controller: _passwordController,
                  decoration: new InputDecoration(
                      labelText: 'Password', border: OutlineInputBorder()),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  width: 290.0,
                  height: 50,
                  child: ButtonTheme(
                    child: ElevatedButton(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                      onPressed: () async {
                        dynamic result = await AuthService()
                            .signupSeller(
                                _emailController.text,
                                _passwordController.text,
                                _firstNameController.text.trim(),
                                _lastNameController.text.trim())
                            .then((r) async {
                          await AuthService().login(
                            _emailController.text,
                            _passwordController.text,
                          );
                        });

                        Navigator.of(context)
                            .pushReplacementNamed('/ProfileLoginSeller');
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(mainColor),
                      ),
                    ),
                  ),
                ),
                new Container(
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      new Text(
                        'Already have an account?',
                        style: TextStyle(fontSize: 16),
                      ),
                      new FlatButton(
                        onPressed: null,
                        child: new Text(
                          'Log in',
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
