import 'package:flutter/material.dart';
import 'package:renter_manager/pages/dashboard/components/dashboard_button.dart';
import 'package:renter_manager/pages/houses/list.dart';
import 'package:renter_manager/pages/renters/list.dart';

class DashboardButtonList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        DashboardButton(
          icon: Icons.person,
          label: "inquilinos",
          navigateTo: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => RentersList(),
            ));
          },
        ),
        DashboardButton(
          icon: Icons.home_filled,
          label: "imóveis",
          navigateTo: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => HousesList(),
            ));
          },
        ),
        DashboardButton(
          icon: Icons.settings_applications,
          label: "Configurações",
          navigateTo: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Pagina em construção'),
                  content: Text(
                      'Ainda estou trabalhando nisso e não sei exatamente como vou fazer kkk'),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text('Ok'))
                  ],
                );
              },
            );
          },
        ),
      ],
    );
  }
}
