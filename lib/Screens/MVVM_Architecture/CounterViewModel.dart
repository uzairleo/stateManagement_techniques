import 'package:flutter/material.dart';


class CounterViewModel extends ChangeNotifier {
  int counter = 0;

  // int get counterValue => _counter;

  void incrementCounter() {
    counter++;
    // Must add notifyListeners() when UI need to be changed.
    notifyListeners();
  }

  void decrementCounter() {
    counter--;
    //No need of setState() function add notifyListeners and it will do it everything for us
    notifyListeners();
  }
}

