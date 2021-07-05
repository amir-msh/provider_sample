import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Counter extends ChangeNotifier {
  // private state :
  int _number;

  Counter({int initialState = 0}) : _number = initialState;

  // state getter :
  int get number => _number;
  int get half => _number ~/ 2;

  // events :
  void increment() {
    _number++;
    notifyListeners();
  }

  void decrement() {
    _number--;
    notifyListeners();
  }
}
