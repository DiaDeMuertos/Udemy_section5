import 'package:flutter/material.dart';

List<DropdownMenuItem<String>> buildItems(List<String> values) {
  return values.map((String value) {
    return DropdownMenuItem(
      value: value,
      child: Text(value),
    );
  }).toList();
}

class CustomCard extends StatelessWidget {
  CustomCard({this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: new Offset(0.0, 5.0),
          ),
        ],
      ),
      child: Container(
        padding: EdgeInsets.only(left: 10),
        color: Colors.white,
        child: child,
      ),
    );
  }
}
