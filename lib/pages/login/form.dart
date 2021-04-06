import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:renter_manager/components/auth_alert_dialog.dart';
import 'package:renter_manager/components/form_button.dart';
import 'package:renter_manager/components/form_input.dart';
import 'package:renter_manager/pages/dashboard/dashboard.dart';
import 'package:renter_manager/pages/signup/form.dart';
import 'package:renter_manager/models/user.dart';

class AuthenticationForm extends StatefulWidget {
  @override
  _AuthenticationFormState createState() => _AuthenticationFormState();
}

class _AuthenticationFormState extends State<AuthenticationForm> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FormInput(
                  controller: _emailController,
                  label: "Email",
                  inputType: TextInputType.emailAddress,
                ),
                FormInput(
                    controller: _passController,
                    label: "Senha",
                    isPassword: true),
                SizedBox(height: 50),
                Consumer<User>(
                  builder: (context, user, child) {
                    Status _status = user.status;
                    if (_status == Status.Authenticating) {
                      return CircularProgressIndicator();
                    }
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FormButton(
                          label: "Novo Usuario",
                          navigateTo: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpForm(),
                            ),
                          ),
                        ),
                        FormButton(
                          label: 'Login',
                          navigateTo: () => _validateForm(context),
                        )
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _validateForm(BuildContext context) {
    if (_formKey.currentState.validate()) {
      _login(
        _emailController.text,
        _passController.text,
        context,
      );
    }
  }

  void _login(String email, String pass, BuildContext context) async {
    final user = Provider.of<User>(context, listen: false);
    try {
      if (await user.loginUser(email, pass)) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Dashboard()),
        );
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AuthAlertDialog(alertMessage: user.getErroMessage);
          },
        );
      }
    } catch (e) {
      print(e);
    }
  }
}
