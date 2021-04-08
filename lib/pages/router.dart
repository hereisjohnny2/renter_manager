import 'package:flutter/material.dart';
import 'package:renter_manager/pages/dashboard/dashboard.dart';
import 'package:renter_manager/pages/login/form.dart';
import 'package:renter_manager/pages/renters/list.dart';
import 'package:renter_manager/pages/signup/form.dart';

class PageRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/auth':
        return MaterialPageRoute(builder: (_) => AuthenticationForm());
      case '/new-user':
        return MaterialPageRoute(builder: (_) => SignUpForm());
      case '/':
        return MaterialPageRoute(builder: (_) => Dashboard());
      case '/renters':
        return MaterialPageRoute(builder: (_) => RentersList());
      // case '/renter':
      //   return MaterialPageRoute(builder: (_) => RenterPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('Não existem rotas para ${settings.name}'),
            ),
          ),
        );
    }
  }
}
