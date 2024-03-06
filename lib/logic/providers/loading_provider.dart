import 'package:flutter/material.dart';

class LoadingProvider extends ChangeNotifier {
  bool isEnd;

  LoadingProvider({this.isEnd=false});

  void changeIsEnd({required bool canEnd}) {
    isEnd = canEnd;
    notifyListeners();
  }
}
