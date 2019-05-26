import 'package:flutter/material.dart';

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
  void handlerFlatButtonClickMe() => print('clicked');

  void handlerRaisedButtonClickMe() => handlerFlatButtonClickMe();

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
            )
          ],
        ),
      ),
    );
  }
}
