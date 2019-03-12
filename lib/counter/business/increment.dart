import 'dart:async';

import 'package:ma_voix_app/counter/business/blocProvider.dart';
import 'package:rxdart/rxdart.dart';

class Increment implements BlocBase {
  int _counter;

  //
  // Stream to handle the counter
  //
  BehaviorSubject<int> _counterController = BehaviorSubject<int>();
  Sink<int> get _inAdd => _counterController.sink;
  Stream<int> get getCounter => _counterController.stream;

  //
  // Stream to handle the action on the counter
  //
  BehaviorSubject _actionController = BehaviorSubject();
  Sink get _incrementCounter => _actionController.sink;

  //
  // Constructor
  //
  Increment() {
    _counter = 0;
    _actionController.stream.listen(_handleLogic);
  }

  void dispose() {
    _actionController.close();
    _counterController.close();
  }

  void _handleLogic(data) {
    _counter = _counter + 1;
    _inAdd.add(_counter);
  }

  void incrementCounter() {
    _incrementCounter.add(null);
  }
}
