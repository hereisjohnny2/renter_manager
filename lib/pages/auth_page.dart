import 'package:renter_manager/main.dart';
import 'package:renter_manager/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthenticationPage extends StatefulWidget {
  @override
  _AuthenticationPageState createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  TextEditingController _userController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsTheme.mainColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image(
            image: AssetImage("assets/images/logo-duo.png"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: [
                TextFormField(
                  controller: _userController,
                  decoration: InputDecoration(
                    labelText: "Usuário",
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 36.0,
                ),
                TextFormField(
                  controller: _passController,
                  decoration: InputDecoration(
                    labelText: "Senha",
                  ),
                  obscureText: true,
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 2.0,
            child: MaterialButton(
              color: Color(0xFFEA6565),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: EdgeInsets.fromLTRB(24.0, 15.0, 24.0, 15.0),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return HomePage();
                  }),
                );
              },
              child: Text(
                "Entrar",
                style: GoogleFonts.montserrat(
                  color: Color(0xFF582B2B),
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
