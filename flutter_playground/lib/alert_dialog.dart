import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AlertDialog Demo',
      home: MyAlertDialog(),
    );
  }
}

class MyAlertDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: _buildAlert,
          barrierDismissible: false,
        );
      },
      child: new Text("Show dialog"),
    );
  }

  Widget _buildAlert(BuildContext context) {
    return new AlertDialog(
      title: new Text("Title"),
      content: new Text("Content"),
      actions: <Widget>[
        new FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: new Text("#1")),
        new FlatButton(
            onPressed: () {
              Navigator.of(context).pop(); //Do something...
            },
            child: new Text("#2"))
      ],
    );
  }
}
