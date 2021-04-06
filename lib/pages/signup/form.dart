import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:renter_manager/components/auth_alert_dialog.dart';
import 'package:renter_manager/components/form_button.dart';
import 'package:renter_manager/components/form_input.dart';
import 'package:renter_manager/constants/color_data.dart';
import 'package:renter_manager/pages/login/form.dart';
import 'package:renter_manager/models/user.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: kColor2,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                FormInput(controller: _nameController, label: "Nome"),
                FormInput(
                  controller: _emailController,
                  label: "Email",
                  inputType: TextInputType.emailAddress,
                ),
                FormInput(
                  controller: _passController,
                  label: "Senha",
                  isPassword: true,
                ),
                SizedBox(height: 50),
                Consumer<User>(
                  builder: (context, user, child) {
                    if (user.status == Status.Creating) {
                      return CircularProgressIndicator();
                    }
                    return FormButton(
                      label: "Criar",
                      navigateTo: () => _validateForm(context),
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
      _signUp(
        _nameController.text,
        _emailController.text,
        _passController.text,
        context,
      );
    }
  }

  void _signUp(
    String name,
    String email,
    String pass,
    BuildContext context,
  ) async {
    final user = Provider.of<User>(context, listen: false);
    try {
      if (await user.signUpUser(email, pass, name)) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => AuthenticationForm()),
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
