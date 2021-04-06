import 'package:flutter/material.dart';
import 'package:renter_manager/models/renter.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    Key key,
    @required this.renter,
  }) : super(key: key);

  final Renter renter;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
                      text: '${renter.nome}'.toUpperCase(),
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
                "${renter.diaPagamento}".toUpperCase(),
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
