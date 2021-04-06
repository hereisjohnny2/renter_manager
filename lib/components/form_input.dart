import 'package:flutter/material.dart';

class FormInput extends StatelessWidget {
  const FormInput({
    Key key,
    @required TextEditingController controller,
    @required String label,
    bool isPassword = false,
  })  : _controller = controller,
        _label = label,
        _isPassword = isPassword,
        super(key: key);

  final TextEditingController _controller;
  final String _label;
  final bool _isPassword;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: TextFormField(
        controller: _controller,
        decoration: InputDecoration(
          labelText: _label,
        ),
        validator: (value) {
          if (value.isEmpty) return 'Digite um valor para $_label';
          return null;
        },
        obscureText: _isPassword,
      ),
    );
  }
}
