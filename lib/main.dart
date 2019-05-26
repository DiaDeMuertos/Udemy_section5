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
  String dropdownValue = 'The Matrix';
  bool isChecked = false;

  final TextEditingController controller = new TextEditingController();

  final List<String> movies = [
    'The Matrix',
    'Children of men',
    'Driver',
    'The witch'
  ];

  void handlerFlatButtonClickMe() => print('clicked');

  void handlerRaisedButtonClickMe() => handlerFlatButtonClickMe();

  void handlerDropDownOnChange(String value) {
    setState(() {
      dropdownValue = value;
    });
  }

  void handlerCheckBoxOnChange(bool value) {
    setState(() {
      isChecked = value;
    });
    print('Checked $value');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            onPressed: handlerFlatButtonClickMe,
            color: Colors.purple,
            textColor: Colors.white,
            highlightColor: Colors.black,
            child: Text(
              'Click Me',
            ),
          ),
          RaisedButton(
            onPressed: handlerRaisedButtonClickMe,
            color: Colors.orange[100],
            elevation: 5,
            highlightElevation: 10,
            child: Text('Click Me'),
          ),
          CustomCard(
            child: DropdownButton(
              value: dropdownValue,
              onChanged: handlerDropDownOnChange,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Checkbox(
                value: isChecked,
                onChanged: handlerCheckBoxOnChange,
              ),
              Text('Done'),
            ],
          ),
        ],
      ),
    );
  }
}
