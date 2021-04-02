import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

enum Status {
  Uninitialized,
  Authenticated,
  Authenticating,
  Unauthenticated,
  Creating,
  Created,
  NotCreated,
}

class Auth extends ChangeNotifier {
  String _uid;
  String _email;
  Status _status = Status.Uninitialized;

  String get getUid => _uid;
  String get getEmail => _email;
  Status get status => _status;

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> loginUser(String email, String password) async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (userCredential.user != null) {
        _status = Status.Authenticated;
        _uid = userCredential.user.uid;
        _email = userCredential.user.email;
        notifyListeners();
        return true;
      }
    } on FirebaseAuthException catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      print(e);
    }
    return false;
  }

  Future<bool> signUpUser(String email, String password) async {
    try {
      _status = Status.Creating;
      notifyListeners();
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        _status = Status.Created;
        _uid = userCredential.user.uid;
        _email = userCredential.user.email;
        notifyListeners();
        return true;
      }
    } catch (e) {
      _status = Status.NotCreated;
      notifyListeners();
      print(e);
    }
    return false;
  }
}
