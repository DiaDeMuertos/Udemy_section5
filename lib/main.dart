import 'dart:async';

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

enum Movies { CaptainMarvel, Shazam }

class _MyHomePageState extends State<MyHomePage> {
  String dropdownValue = 'The Matrix';
  bool isChecked = false;
  int groupA = 1;
  int groupB = 2;
  int volume = 0;
  bool state = false;
  double minutes = 0;
  DateTime dateNow = DateTime.now();
  TimeOfDay timeNow = TimeOfDay.now();

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

  void handlerSwitchOnChange(bool newState) {
    setState(() {
      state = newState;
    });
  }

  void handlerSliderOnChange(double newValue) {
    setState(() {
      minutes = newValue;
    });
  }

  Future<void> selectedDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: dateNow,
      firstDate: DateTime(2019),
      lastDate: DateTime(2020),
    );

    if (picked != null && picked != dateNow) {
      print(dateNow.toString());
      setState(() {
        dateNow = picked;
      });
    }
  }

  Function handlerSelectDateOnPressed(BuildContext context) {
    return () => selectedDate(context);
  }

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: timeNow,
    );

    if (picked != null && picked != timeNow) {
      print(timeNow.toString());
      setState(() {
        timeNow = picked;
      });
    }
  }

  Function handlerSelectTimeOnPressed(BuildContext context) {
    return () => selectTime(context);
  }

  Future<void> openDialog(BuildContext context) async {
    switch (await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text('Select A Movie'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, Movies.CaptainMarvel);
                },
                child: Text('Capitain Marvel'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, Movies.Shazam);
                },
                child: Text('Shazam'),
              ),
            ],
          );
        })) {
      case Movies.CaptainMarvel:
        print('Captain Marvel');
        print(Movies);
        break;
      case Movies.Shazam:
        print('Shazam');
        break;
    }
  }

  Function handlerOpenDialogOnPressed(BuildContext context) {
    return () => openDialog(context);
  }

  Future<void> openAlert(BuildContext context) async {
    await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Phone Alert'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('Your Phone us too hot!!!!'),
                  Text('Put it in Water :D'),
                ],
              ),
            ),
            actions: <Widget>[
              RaisedButton(
                child: Text('Continue'),
                textColor: Colors.white,
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          );
        });
  }

  Function handlerOpenAlertOnPressed(BuildContext context) {
    return () => openAlert(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                onPressed: handlerFlatButtonOnPressed,
                color: Colors.purple,
                textColor: Colors.white,
                highlightColor: Colors.black,
                child: Text('Click Me'),
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
              FloatingActionButton(
                child: Icon(Icons.phone),
                mini: true,
                onPressed: () => {},
              ),
              Switch(
                value: state,
                onChanged: handlerSwitchOnChange,
                activeColor: Colors.red,
                activeThumbImage: AssetImage('assets/images/skull_tattoo.png'),
              ),
              Slider(
                label: minutes.toString(),
                value: minutes,
                divisions: 10,
                min: 0,
                max: 60,
                onChanged: handlerSliderOnChange,
              ),
              IconButton(
                icon: Icon(Icons.date_range),
                onPressed: handlerSelectDateOnPressed(context),
              ),
              IconButton(
                icon: Icon(Icons.timer),
                onPressed: handlerSelectTimeOnPressed(context),
              ),
              IconButton(
                icon: Icon(Icons.movie),
                onPressed: handlerOpenDialogOnPressed(context),
              ),
              IconButton(
                icon: Icon(Icons.add_alarm),
                onPressed: handlerOpenAlertOnPressed(context),
              )
            ],
          ),
        ],
      ),
    );
  }
}
