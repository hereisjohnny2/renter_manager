import 'package:renter_manager/models/house.dart';
import 'package:renter_manager/models/renter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:renter_manager/pages/houses/list.dart';
import 'package:renter_manager/pages/renters/list.dart';
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
    return Scaffold(
      backgroundColor: Color(0xFFFA8A8A),
      body: Padding(
        padding: EdgeInsets.fromLTRB(25.0, 70.0, 25.0, 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "BEM-VINDO! :)".toUpperCase(),
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: ListView.builder(
                  itemCount: renters.length,
                  itemBuilder: (context, index) {
                    return buildMainPageNotificationCard(context, index);
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                buildMainPageButton("inquilinos", Icons.person, () {
                  return RentersList(renters);
                }),
                buildMainPageButton("imóveis", Icons.home, () {
                  return HousesList(houses);
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMainPageNotificationCard(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        print("notificação!");
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(31.0, 21.0, 31.0, 21.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              RichText(
                text: TextSpan(
                  text: 'O Aluguel de '.toUpperCase(),
                  style: Theme.of(context).textTheme.bodyText1,
                  children: <TextSpan>[
                    TextSpan(
                      text: '${renters[index].nome}'.toUpperCase(),
                      style: TextStyle(
                        color: Color(0xFFFA8A8A),
                      ),
                    ),
                    TextSpan(text: ' está pra vencer! :/'.toUpperCase()),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0, bottom: 4.0),
                child: Text(
                  "Próximo Pagamento",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
              Text(
                "${renters[index].diaPagamento}".toUpperCase(),
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMainPageButton(
      String text, IconData mainIcon, Function dataPage) {
    return Flexible(
      child: Container(
        height: 90.0,
        width: 150.0,
        child: MaterialButton(
          color: Color(0xFFEA6565),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: EdgeInsets.fromLTRB(24.0, 15.0, 24.0, 15.0),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => dataPage()),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(
                mainIcon,
                color: Color(0xFF582B2B),
                size: 36.0,
              ),
              Text(
                text.toUpperCase(),
                style: GoogleFonts.montserrat(
                  color: Color(0xFF582B2B),
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
