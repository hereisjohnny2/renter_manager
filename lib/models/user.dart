import 'package:cloud_firestore/cloud_firestore.dart';
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
  Leaving,
}

class User extends ChangeNotifier {
  String _uid;
  String _email;
  String _name;
  Status _status = Status.Uninitialized;
  String _erroMessage;

  String get getUid => _uid;
  String get getEmail => _email;
  String get getName => _name;
  Status get status => _status;
  String get getErroMessage => _erroMessage;

  FirebaseAuth _user = FirebaseAuth.instance;
  CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');

  Future<bool> loginUser(String email, String password) async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      UserCredential userCredential = await _user.signInWithEmailAndPassword(
          email: email, password: password);
      if (userCredential.user != null) {
        _status = Status.Authenticated;
        _uid = userCredential.user.uid;
        _email = userCredential.user.email;
        notifyListeners();
        return true;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        _erroMessage = 'Usuário não encontrado';
      } else if (e.code == 'wrong-password') {
        _erroMessage = 'Senha incorreta';
      }
      _status = Status.Unauthenticated;
      notifyListeners();
    }
    return false;
  }

  Future<bool> signUpUser(String email, String password, String name) async {
    try {
      _status = Status.Creating;
      notifyListeners();
      UserCredential userCredential = await _user
          .createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        _status = Status.Created;
        _uid = userCredential.user.uid;
        _email = userCredential.user.email;
        _name = name;
        saveUser();
        notifyListeners();
        return true;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        _erroMessage = 'Email já em uso!';
      }
      _status = Status.NotCreated;
      notifyListeners();
      print(e);
    }
    return false;
  }

  Future<void> logOut() async {
    try {
      _status = Status.Leaving;
      notifyListeners();
      await _user.signOut();
    } catch (e) {
      print(e);
    }
    _status = Status.Uninitialized;
  }

  Future<void> saveUser() async {
    try {
      return _usersCollection.doc(_uid).set({
        'email': _email,
        'name': _name,
      });
    } on Exception catch (e) {
      print(e);
    }
  }
}
