// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppModel extends ChangeNotifier {
  int counter = -11;

  List<String> list = [];

  void addCounter() {
    counter++;
    notifyListeners();
  }
}
