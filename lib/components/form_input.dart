import 'package:flutter/material.dart';

class FormInput extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool isPassword;
  final TextInputType inputType;

  const FormInput({
    Key key,
    TextEditingController controller,
    String label,
    bool isPassword = false,
    TextInputType inputType = TextInputType.text,
  })  : controller = controller,
        label = label,
        isPassword = isPassword,
        inputType = inputType,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
        ),
        validator: (value) {
          if (value.isEmpty) return 'Digite um valor para $label';
          return null;
        },
        obscureText: isPassword,
        keyboardType: inputType,
      ),
    );
  }
}
