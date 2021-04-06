import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:renter_manager/models/house.dart';
import 'package:renter_manager/models/renter.dart';
import 'package:flutter/material.dart';
import 'package:renter_manager/models/user.dart';
import 'package:renter_manager/pages/dashboard/components/dashboard_button_list.dart';
import 'package:renter_manager/pages/dashboard/components/welcome_bar.dart';

import 'package:renter_manager/data/fakeData.dart';

List<Renter> loadRentersDataFromFakeInfo(List<Map> fakeData) {
  List<Renter> outputRenters = [];
  for (var item in fakeData) {
    outputRenters.add(new Renter(
      item["nome"],
      item["telefone"],
      item["endereco"],
      item["valorAluguel"],
      item["dia_pagamento"],
    ));
  }
  return outputRenters;
}

List<House> loadHousesDataFromFakeInfo(List<Map> houses) {
  List<House> outputHouses = [];
  for (var house in houses) {
    outputHouses.add(new House(
      house["endereco"],
      house["complemento"],
      house["descricao"],
      house["valorAluguel"],
      house["area"],
      house["estado"],
    ));
  }
  return outputHouses;
}

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final List<Renter> renters = loadRentersDataFromFakeInfo(rentersData);
  final List<House> houses = loadHousesDataFromFakeInfo(housesData);

  @override
  Widget build(BuildContext context) {
    final _user = Provider.of<User>(context, listen: false);
    DocumentReference _userData =
        FirebaseFirestore.instance.collection("users").doc(_user.getUid);
    return Scaffold(
      backgroundColor: Color(0xFFFA8A8A),
      body: FutureBuilder(
        future: _userData.get(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Algo deu errado"),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data = snapshot.data.data();
            return Padding(
              padding: EdgeInsets.fromLTRB(16.0, 30.0, 16.0, 16.0),
              child: Column(
                children: [
                  WelcomeBar(user: _user, name: data['name']),
                  Expanded(
                    flex: 10,
                    child: Container(),
                  ),
                  DashboardButtonList(),
                ],
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
