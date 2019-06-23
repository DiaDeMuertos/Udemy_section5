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

class Radios extends StatefulWidget {
  Radios({Key key}) : super(key: key);

  @override
  _RadiosState createState() => _RadiosState();
}

class _RadiosState extends State<Radios> {
  int groupA = 1;
  int groupB = 2;

  void handlerGroupAOnChange(int value) {
    setState(() {
      groupA = value;
    });
  }

  void handlerGroupBOnChange(int value) {
    setState(() {
      groupB = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Row(
          children: <Widget>[
            Radio(
              value: 0,
              groupValue: groupA,
              onChanged: handlerGroupAOnChange,
            ),
            Text('Si')
          ],
        ),
        Row(
          children: <Widget>[
            Radio(
              value: 1,
              groupValue: groupA,
              onChanged: handlerGroupAOnChange,
            ),
            Text('No')
          ],
        ),
        Row(
          children: <Widget>[
            Radio(
              value: 0,
              groupValue: groupB,
              onChanged: handlerGroupBOnChange,
            ),
            Text('Men')
          ],
        ),
        Row(
          children: <Widget>[
            Radio(
              value: 2,
              groupValue: groupB,
              onChanged: handlerGroupBOnChange,
            ),
            Text('Woman')
          ],
        )
      ],
    );
  }
}

enum Places { a, b, c }

Widget menuPlaces() {
  return PopupMenuButton(
    icon: Icon(Icons.menu),
    itemBuilder: (BuildContext context) => [
          PopupMenuItem(
            value: Places.a,
            child: Text('A'),
          ),
          PopupMenuItem(
            value: Places.b,
            child: Text('B'),
          ),
          PopupMenuItem(
            value: Places.c,
            child: Text('C'),
          )
        ],
    onSelected: (Places result) => print(result),
  );
}

class MyItem {
  MyItem({this.isExpanded: false, this.header, this.body});

  bool isExpanded;
  final String header;
  final String body;
}
