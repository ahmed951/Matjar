import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'login.dart';
import 'modules/user.dart';
import 'signUp.dart';
import 'landingPage.dart';
import 'home.dart';
import 'profileInfo.dart';
import 'ProfileEdit.dart';
import 'SignUpSeller.dart';
import 'profile.dart';
import 'profileEditSeller.dart';
import 'profileInfoSeller.dart';
import 'profileLoggedIn.dart';
import 'ProfileLoginSeller.dart';
import 'auth/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Userinit>.value(
      value: AuthService().user,
      child: MaterialApp(
        initialRoute: '/',
        routes: <String, WidgetBuilder>{
          '/': (context) => LandingPage(),
          '/Login': (context) => Login(),
          '/SignUp': (context) => SignUp(),
          '/Home': (context) => HomePage(),
          '/Profile': (context) => Profile(),
          '/ProfileInfo': (context) => ProfileInfo(),
          '/ProfileEdit': (context) => ProfileEdit(),
          '/ProfileEditSeller': (context) => ProfileEditSeller(),
          '/ProfileLoginSeller': (context) => ProfileLogInSeller(),
          '/ProfileLoggedIn': (context) => ProfileLoggedIn(),
          '/SignUpSeller': (context) => SignUpSeller(),
          '/ProfileInfoSeller': (context) => ProfileInfoSeller(),
        },
      ),
    );
  }
}
