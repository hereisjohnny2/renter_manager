import 'package:provider/provider.dart';
import 'package:renter_manager/models/renter.dart';
import 'package:renter_manager/models/renters.dart';
import 'package:renter_manager/pages/renters/renter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RentersList extends StatelessWidget {
  List renters = [];

  @override
  Widget build(BuildContext context) {
    final rentersProvider = Provider.of<Renters>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xFFFA8A8A),
      ),
      backgroundColor: Color(0xFFFA8A8A),
      body: StreamBuilder(
        stream: rentersProvider.fetchRentersAsStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            renters = snapshot.data.docs
                .map((doc) => Renter.fromMap(doc.data(), doc.id))
                .toList();
            return Padding(
              padding: EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "INQUILINOS".toUpperCase(),
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
                              labelText: "Buscar Inquilinos",
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
                      itemCount: renters.length,
                      itemBuilder: (context, index) {
                        return buildRenterCard(context, index);
                      },
                    ),
                  )
                ],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
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
                  builder: (context) => RenterPage(renters[index]),
                ),
              );
            },
            title: Text(
              renters[index].nome,
              style: TextStyle(fontSize: 16.0),
            ),
            subtitle: Text(
              renters[index].endereco,
              style: TextStyle(fontSize: 12.0),
            ),
            trailing: Container(
              height: 40.0,
              decoration: BoxDecoration(
                color: Color(0xFFEA6565),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(Icons.phone),
                onPressed: () {
                  print("click phone");
                },
                color: Colors.white,
              ),
            )),
      ),
    );
  }
}
