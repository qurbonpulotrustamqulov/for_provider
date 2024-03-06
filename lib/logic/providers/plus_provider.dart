import 'package:flutter/material.dart';

class PlusProvider extends ChangeNotifier {
  bool isTrue;
  bool isTrue2;
  PlusProvider({this.isTrue = false, this.isTrue2 = false});

  void addResult(bool can) {
    isTrue = can;
    notifyListeners();
  }
  void addStart() {
    if(isTrue2 ==true){
      isTrue2 = false;
    }
    else{
      isTrue2 = true;
    }
    notifyListeners();
  }
}
