import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:renter_manager/models/renter.dart';
import 'package:renter_manager/models/user.dart';
import 'package:renter_manager/services/firestore_api.dart';

class Renters extends ChangeNotifier {
  // User _user;
  Api _api;
  List<Renter> _renters;

  void update(User user) {
    _api = Api(pathToCollection: 'users/${user.getUid}/renters');
  }

  int numberOfRenters() => _renters.length;

  Future<List<Renter>> fetchRenters() async {
    final result = await _api.getDataCollection();
    _renters =
        result.docs.map((doc) => Renter.fromMap(doc.data(), doc.id)).toList();
    return _renters;
  }

  Stream<QuerySnapshot> fetchRentersAsStream() {
    return _api.streamDataCollection();
  }

  Future<Renter> getRenterById(String id) async {
    final doc = await _api.getDocumentById(id);
    return Renter.fromMap(doc.data(), doc.id);
  }

  Future<void> removeRenterById(String id) async {
    await _api.removeDocumentById(id);
    return;
  }

  Future<void> updateRenterById(Renter data, String id) async {
    await _api.updateDocumentById(data.toJson(), id);
    return;
  }

  Future<void> addRenter(Renter data) async {
    await _api.addDocument(data.toJson());
    return;
  }
}
