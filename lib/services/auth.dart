// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:loginfede/models/user.dart';
import 'package:loginfede/screens/authenticate/register.dart';
import 'package:loginfede/services/database.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user obj based on firebase

  Username? _userFromFirebaseUser(User? user) {
    return user != null ? Username(uid: user.uid) : null;
  }

  // auth change user stream

  Stream<Username?> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
    //return _auth
    //    .authStateChanges()
    //    .map((User? user) => _userFromFirebaseUser(user!));
  }

  //sign in anonimous
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign email+pass
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register with email+pass
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;

      //create doc of user
      await DatabaseService(uid: user!.uid).updateUserData('', '', '', '', '',
          ''); //'$name', '$surname', $age, $weigth, $heigth, $nickname
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
