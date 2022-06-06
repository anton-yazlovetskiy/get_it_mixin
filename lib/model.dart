// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

class AppModel extends ChangeNotifier {
  int counter = -11;

  List<String> list = [];
  ValueListenable<List<String>> listLisn = ValueNotifier([]);

  void addCounter() {
    counter++;
    notifyListeners();
  }
}
