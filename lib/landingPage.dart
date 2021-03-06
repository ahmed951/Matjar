import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:matjar_login_signup/login.dart';
import 'package:matjar_login_signup/modules/user.dart';
import 'package:matjar_login_signup/profile.dart';
import 'package:matjar_login_signup/profileLoggedIn.dart';
import 'package:provider/provider.dart';
import 'signUp.dart';
import 'home.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Userinit>(context);

    if (user == null) {
      return Login();
    } else {
      return ProfileLoggedIn();
    }

    /* final user = Provider.of<User>(context);
    return FutureBuilder(
      future: _init,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            backgroundColor: Colors.red[700],
            body: Center(
              child: Text(
                "Error:${snapshot.error}",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                User user = snapshot.data;
                if (user == null) {
                  return SignUp();
                } else {
                  return HomePage();
                }
              }

              return Scaffold(
                backgroundColor: Colors.red[700],
                body: Center(
                  child: Text(
                    "Matjar",
                    style: TextStyle(
                      fontSize: 40,
                      fontFamily: "DancingScript",
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            },
          );
        }
        return Scaffold(
          backgroundColor: Colors.red[700],
          body: Center(
            child: Text(
              "Matjar",
              style: TextStyle(
                fontSize: 40,
                fontFamily: "DancingScript",
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    ); */
  }
}
