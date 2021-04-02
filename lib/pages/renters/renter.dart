import 'package:renter_manager/models/renter.dart';
import 'package:flutter/material.dart';

class RenterPage extends StatelessWidget {
  final Renter inquilino;
  RenterPage(this.inquilino);

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
      backgroundColor: Color(0xFFFA8A8A),
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
                  inquilino.nome,
                  style: Theme.of(context).textTheme.headline1,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Text(inquilino.endereco,
                      style: Theme.of(context).textTheme.subtitle2),
                ),
                Text(inquilino.telefone,
                    style: Theme.of(context).textTheme.subtitle2),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text("Próximo Pagamento",
                      style: Theme.of(context).textTheme.bodyText1),
                ),
                Text(
                  "${inquilino.diaPagamento}/06",
                  style: Theme.of(context).textTheme.headline1,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text("Valor do Aluguel",
                      style: Theme.of(context).textTheme.bodyText1),
                ),
                Text(
                  "R\$ ${inquilino.valorAluguel.toStringAsFixed(2)}",
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
                    "Recibos".toUpperCase(),
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
            ]),
          )
        ],
      ),
    );
  }
}
