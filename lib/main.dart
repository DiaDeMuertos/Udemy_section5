import 'package:flutter/material.dart';

import './helpers.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Udemy course',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(title: 'Flutter & Dart'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _dropdownValue = 'The Matrix';

  final TextEditingController controller = new TextEditingController();

  final List<String> movies = [
    'The Matrix',
    'Children of men',
    'Driver',
    'The witch'
  ];

  void _handlerFlatButtonClickMe() => print('clicked');

  void _handlerRaisedButtonClickMe() => _handlerFlatButtonClickMe();

  void _handlerDropDownOnChange(String value) {
    setState(() {
      _dropdownValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              onPressed: _handlerFlatButtonClickMe,
              color: Colors.purple,
              textColor: Colors.white,
              highlightColor: Colors.black,
              child: Text(
                'Click Me',
              ),
            ),
            RaisedButton(
              onPressed: _handlerRaisedButtonClickMe,
              color: Colors.orange[100],
              elevation: 5,
              highlightElevation: 10,
              child: Text('Click Me'),
            ),
            CustomCard(
              child: DropdownButton(
                value: _dropdownValue,
                onChanged: _handlerDropDownOnChange,
                items: buildItems(movies),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: TextField(
                onChanged: (String value) => print('typed...$value'),
                onSubmitted: (String value) => print('submitted'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
