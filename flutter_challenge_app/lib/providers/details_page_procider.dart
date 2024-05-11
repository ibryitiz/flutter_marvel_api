import 'package:flutter/material.dart';

class DetailsPageProvider extends ChangeNotifier {
  int? _year;
  int get year => _year!;

  set year(int value) {
    _year = value;
  }

  int getYear(String name) {
    try {
      year = int.parse(name.split("(").last.substring(0, 4));
    } catch (e) {
      year = -1;
    }
    return year;
  }
}
