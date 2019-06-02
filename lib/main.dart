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
  int groupA = 1;
  int groupB = 2;
  int volume = 0;

  final TextEditingController controller = new TextEditingController();

  final List<String> movies = [
    'The Matrix',
    'Children of men',
    'Driver',
    'The witch'
  ];

  void handlerFlatButtonOnPressed() => print('clicked');

  void handlerRaisedButtonOnPressed() => handlerFlatButtonOnPressed();

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

  void hanlderTextFieldOnChanged(String value) => print('typed...$value');

  void hanlderTextFieldOnSubmitted(String value) => print('submitted');

  void handlerVolumeUpOnPressed() {
    setState(() {
      volume = volume + 1;
    });
  }

  void handlerVolumeDownOnPressed() {
    setState(() {
      volume = volume - 1 < 0 ? 0 : volume - 1;
    });
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
            onPressed: handlerFlatButtonOnPressed,
            color: Colors.purple,
            textColor: Colors.white,
            highlightColor: Colors.black,
            child: Text(
              'Click Me',
            ),
          ),
          RaisedButton(
            onPressed: handlerRaisedButtonOnPressed,
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
              onChanged: hanlderTextFieldOnChanged,
              onSubmitted: hanlderTextFieldOnSubmitted,
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
          Radios(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              menuPlaces(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.volume_up),
                tooltip: 'Up the volume',
                onPressed: handlerVolumeUpOnPressed,
              ),
              Text(volume.toString()),
              IconButton(
                icon: Icon(Icons.volume_down),
                tooltip: 'Down the volume',
                onPressed: handlerVolumeDownOnPressed,
              )
            ],
          ),
          SizedBox(
            height: 50,
            child: ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Text('GO'),
                  onPressed: () {},
                ),
                RaisedButton(
                  child: Text('GO'),
                  onPressed: () {},
                ),
                IconButton(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(0),
                  icon: Icon(Icons.done),
                  onPressed: () {},
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
