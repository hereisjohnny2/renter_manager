import 'package:flutter/material.dart';
import 'package:renter_manager/constants/color_data.dart';

class FormButton extends StatelessWidget {
  final void Function() navigateTo;
  final String label;

  const FormButton({Key key, @required this.navigateTo, this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 50,
      child: ElevatedButton(
        child: Text(label),
        onPressed: () => navigateTo(),
        style: ElevatedButton.styleFrom(
          primary: kColor2,
        ),
      ),
    );
  }
}
