import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:matjar_login_signup/UI/login.dart';
import 'package:matjar_login_signup/UI/signUp.dart';
import 'package:matjar_login_signup/UI/home.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    title: "Matjar",
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: "Navigation",
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => LandingPage(),
        '/Login': (context) => Login(),
        '/SignUp': (context) => SignUp(),
        '/Home': (context) => HomePage(),
      },
    );
  }
}

class LandingPage extends StatelessWidget {
  final Future<FirebaseApp> _init = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
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
    );
  }
}

/* class App extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return SomethingWentWrong();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MyAwesomeApp();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Loading();
      },
    );
  }
} */
