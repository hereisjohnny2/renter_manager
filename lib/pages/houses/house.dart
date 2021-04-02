import 'package:renter_manager/constants/theme_data.dart';
import 'package:renter_manager/models/house.dart';
import 'package:flutter/material.dart';

class HousePage extends StatelessWidget {
  final House house;
  HousePage(this.house);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFFFA8A8A)),
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.edit),
              color: Color(0xFFFA8A8A),
              onPressed: () {}),
        ],
      ),
      backgroundColor: ColorsTheme.mainColor,
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(20, 24, 20, 57),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(70.0))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  house.endereco,
                  style: Theme.of(context).textTheme.headline1,
                ),
                Text(house.complemento,
                    style: Theme.of(context).textTheme.subtitle2),
                Text(house.estadoAlugada ? "Disponível" : "Alugada",
                    style: Theme.of(context).textTheme.subtitle2),
                Text(house.descricao,
                    style: Theme.of(context).textTheme.subtitle2),
                Text("${house.area} m²",
                    style: Theme.of(context).textTheme.subtitle2),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text("Valor do Aluguel",
                      style: Theme.of(context).textTheme.bodyText1),
                ),
                Text(
                  "R\$ ${house.valorAluguel.toStringAsFixed(2)}",
                  style: Theme.of(context).textTheme.headline1,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 36, 20, 20),
            child: Column(children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Documentos".toUpperCase(),
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  IconButton(
                    icon: Icon(Icons.keyboard_arrow_down),
                    onPressed: () {},
                    iconSize: 48.0,
                    color: Colors.white,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Fotos".toUpperCase(),
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  IconButton(
                    icon: Icon(Icons.keyboard_arrow_down),
                    onPressed: () {},
                    iconSize: 48.0,
                    color: Colors.white,
                  )
                ],
              ),
            ]),
          )
        ],
      ),
    );
  }
}
