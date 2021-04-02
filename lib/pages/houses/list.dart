import 'package:renter_manager/models/house.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:renter_manager/pages/houses/house.dart';

class HousesList extends StatelessWidget {
  final List<House> houses;
  HousesList(this.houses);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xFFFA8A8A),
      ),
      backgroundColor: Color(0xFFFA8A8A),
      body: Padding(
        padding: EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "imóveis".toUpperCase(),
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 51.0, bottom: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "Buscar Imóveis",
                        labelStyle: TextStyle(
                          fontSize: 12.0,
                          color: Color(0x8C582B2B),
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      style: TextStyle(fontSize: 12.0),
                    ),
                  ),
                  IconButton(icon: Icon(Icons.sort), onPressed: () {})
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: houses.length,
                itemBuilder: (context, index) {
                  return buildRenterCard(context, index);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildRenterCard(BuildContext context, int index) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(bottom: 12.0),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HousePage(houses[index]),
                ),
              );
            },
            title:
                Text(houses[index].endereco, style: TextStyle(fontSize: 16.0)),
            subtitle: Text(
                houses[index].estadoAlugada ? "Disponível" : "Alugada",
                style: TextStyle(fontSize: 12.0)),
            trailing: Container(
              height: 40.0,
              decoration: BoxDecoration(
                color: Color(0xFFEA6565),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(Icons.share),
                onPressed: () {
                  print("click share");
                },
                color: Colors.white,
              ),
            )),
      ),
    );
  }
}
