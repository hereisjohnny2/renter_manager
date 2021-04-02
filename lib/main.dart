import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:renter_manager/constants/theme_data.dart';
import 'package:renter_manager/models/auth.dart';
import 'package:renter_manager/pages/login/form.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Auth()),
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
      home: AuthenticationForm(),
      debugShowCheckedModeBanner: false,
      theme: themeData,
    );
  }
}
