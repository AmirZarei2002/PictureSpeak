import 'package:flutter/material.dart';

Color hexToColor(String hex) {
  var value = hex.replaceFirst('#', '').trim();
  if (value.length == 6) value = 'FF$value'; 
  return Color(int.parse(value, radix: 16));
}
