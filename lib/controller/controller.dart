import 'package:flutter/material.dart';
import 'package:riverpod_counter_app/model/count_model.dart';

class Controller extends ChangeNotifier {
  final CountModel _increment = CountModel(0);
  final CountModel _decrement = CountModel(0); //int value = 0
  CountModel get incrementcount => _increment;
  CountModel get decrementcount => _decrement;

  void incrementcounter() {
    _increment.countvalue++;
  }

  void decrementcounter() {
    if (_increment.countvalue > 0) {
      _decrement.countvalue = _increment.countvalue;
      _increment.countvalue--;
    }
  }
}
