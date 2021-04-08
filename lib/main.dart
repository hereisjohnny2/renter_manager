import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:renter_manager/models/renters.dart';

import 'package:renter_manager/models/user.dart';
import 'package:renter_manager/pages/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => User()),
        ChangeNotifierProxyProvider<User, Renters>(
          create: (_) => Renters(),
          update: (_, User user, Renters renters) => renters..update(user),
        ),
      ],
      child: RenterManagerApp(),
    ),
  );
}

class RenterManagerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Renter Manager',
      debugShowCheckedModeBanner: false,
      initialRoute: '/auth',
      onGenerateRoute: PageRouter.generateRoute,
      // theme: themeData,
    );
  }
}
