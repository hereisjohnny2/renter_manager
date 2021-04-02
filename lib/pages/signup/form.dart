import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:renter_manager/components/text_input.dart';
import 'package:renter_manager/pages/login/form.dart';
import 'package:renter_manager/models/auth.dart';

import '../../constants/theme_data.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void _signUp(String email, String pass, BuildContext context) async {
    final auth = Provider.of<Auth>(context, listen: false);

    try {
      if (await auth.signUpUser(email, pass)) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => AuthenticationForm()),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context);
    return Scaffold(
      backgroundColor: ColorsTheme.mainColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorsTheme.mainColor,
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextInput(controller: _nameController, label: "Nome"),
                TextInput(controller: _emailController, label: "Email"),
                TextInput(
                  controller: _passController,
                  label: "Senha",
                  isPassword: true,
                ),
                auth.status == Status.Creating
                    ? Center(child: CircularProgressIndicator())
                    : Padding(
                        padding: EdgeInsets.all(16.0),
                        child: ElevatedButton(
                          child: Text('Criar'),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              _signUp(
                                _emailController.text,
                                _passController.text,
                                context,
                              );
                            }
                          },
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
