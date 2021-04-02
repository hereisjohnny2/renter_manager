import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:renter_manager/components/text_input.dart';
import 'package:renter_manager/pages/dashboard/dashboard.dart';
import 'package:renter_manager/pages/signup/form.dart';
import 'package:renter_manager/models/auth.dart';
import '../../constants/theme_data.dart';

class AuthenticationForm extends StatefulWidget {
  @override
  _AuthenticationFormState createState() => _AuthenticationFormState();
}

class _AuthenticationFormState extends State<AuthenticationForm> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  void _login(String email, String pass, BuildContext context) async {
    final auth = Provider.of<Auth>(context, listen: false);
    try {
      if (await auth.loginUser(email, pass)) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Dashboard()),
        );
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context);
    return Scaffold(
      backgroundColor: ColorsTheme.mainColor,
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextInput(controller: _emailController, label: "Email"),
              TextInput(
                controller: _passController,
                label: "Senha",
                isPassword: true,
              ),
              auth.status == Status.Authenticating
                  ? Center(child: CircularProgressIndicator())
                  : Padding(
                      padding: EdgeInsets.all(16.0),
                      child: ElevatedButton(
                        child: Text('Entrar'),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            _login(
                              _emailController.text,
                              _passController.text,
                              context,
                            );
                          }
                        },
                      ),
                    ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: ElevatedButton(
                  child: Text('Criar Novo Usuário'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpForm(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
