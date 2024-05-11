import 'package:flutter/material.dart';

class MyColors {
  static MyColors? _instance;
  static MyColors get instance {
    _instance ??= MyColors._init();
    return _instance!;
  }

  MyColors._init();

  Color cardColor = Colors.grey.shade800;
  Color whiteColor = const Color(0xffffffff);
  Color blackColor = Colors.grey.shade900;
  Color transparentColor = Colors.transparent;
  Color textColor = Colors.grey.shade300;
  Color linkColor = const Color.fromARGB(255, 6, 133, 237);
  Color logoColor = Colors.red.shade900;
}
