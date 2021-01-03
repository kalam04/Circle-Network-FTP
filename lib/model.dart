import 'package:flutter/material.dart';


class MyModel with ChangeNotifier { //                          <--- MyModel
  int someValue = 0;

  void doSomething() {
    debugPrint("one");
    someValue = someValue+1;
    //print(someValue);
    notifyListeners();
  }
}
