//import 'package:firebase_database/firebase_database.dart';

/*
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
class UserMain {
  String _id, _firstName, _lastName, _currency, _address, _email, _password;
  //User(this._firstName, this._lastName);
  /* User.map(dynamic obj) {
    this._firstName = obj['firstName'];
    this._lastName = obj['lastName'];
    this._currency = obj['currency'];
    this._address = obj['address'];
    this._email = obj['email'];
    this._password = obj['password'];
  } */
  /*
  String get id => _id;
  String get firstName => _firstName;
  String get lastName => _lastName;
  String get currency => _currency;
  String get address => _address;
  String get email => _email;
  String get password => _password;

  User.fromSnapShot(snapShot) {
    _id = snapShot.key;
    _firstName = snapShot.value['firstName'];
    _lastName = snapShot.value['lastName'];
    _currency = snapShot.value['currency'];
    _address = snapShot.value['address'];
    _email = snapShot.value['email'];
    _password = snapShot.value['password'];
  }
 */
  /*addNewUser(user, context) {
    FirebaseDatabase.instance.reference().child('users').push().set({
      'email': user.email,
      'uid': user.uid,
      // فى باسورد هنا ؟؟؟
    }).then((value) {
      Navigator.of(context).pop();
    }).catchError((e) {
      print(e);
    });
  }*/
}

*/

import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  /// Changed to idTokenChanges as it updates depending on more cases.
  Stream<User> get authStateChanges => _firebaseAuth.idTokenChanges();

  /// This won't pop routes so you could do something like
  /// Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  /// after you called this method if you want to pop all routes.
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  /// There are a lot of different ways on how you can do exception handling.
  /// This is to make it as easy as possible but a better way would be to
  /// use your own custom class that would take the exception and return better
  /// error messages. That way you can throw, return or whatever you prefer with that instead.
  Future<String> signIn({String email, String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Signed in";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  /// There are a lot of different ways on how you can do exception handling.
  /// This is to make it as easy as possible but a better way would be to
  /// use your own custom class that would take the exception and return better
  /// error messages. That way you can throw, return or whatever you prefer with that instead.
  Future<String> signUp({String email, String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "Signed up";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}
