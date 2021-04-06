import 'package:flutter/material.dart';
import 'package:renter_manager/models/renter.dart';

class Renters extends ChangeNotifier {
  final List<Renter> _renters;

  Renters(this._renters);
  int numberOfRenters() => _renters.length;
}
