import 'package:flutter/material.dart';

class MyBorderRadius {
  static const imageBorderRadius = BorderRadius.only(
    bottomLeft: Radius.circular(24),
    topLeft: Radius.circular(24),
  );
  static const containerBorderRadius = BorderRadius.all(Radius.circular(24));
  static const detailsImageBorderRadius = BorderRadius.only(
    topLeft: Radius.circular(48),
    topRight: Radius.circular(48),
  );
}
