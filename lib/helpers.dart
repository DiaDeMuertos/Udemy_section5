import 'package:flutter/material.dart';

List<DropdownMenuItem<String>> buildItems(List<String> values) {
  return values.map((String value) {
    return DropdownMenuItem(
      value: value,
      child: Text(value),
    );
  }).toList();
}
