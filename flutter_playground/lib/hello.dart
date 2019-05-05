import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(HelloApp());

class HelloApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello',
      home: HelloHomePage(title: 'Hello'),
    );
  }
}

class HelloHomePage extends StatefulWidget {
  HelloHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HelloHomePageState createState() => _HelloHomePageState();
}

class _HelloHomePageState extends State<HelloHomePage> {
  bool _first = true;
  String name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Padding(
            padding: EdgeInsets.all(8.0), child: _first ? first() : second()));
  }

  first() {
    var welcome = new Text("""
Guten Tag. Schön, dass Sie mich gestartet haben. 
Bitte verraten Sie mir Ihren Namen"""
        .trim()
        .replaceAll("\n", " "));
    var input = new TextField(onChanged: textChanged);
    var next = new FlatButton(
      onPressed: name.length > 0 ? nextPressed : null,
      child: const Text("Weiter"),
    );
    var children = [
      welcome,
      input,
      new Align(alignment: Alignment.centerRight, child: next)
    ];
    return Column(children: children);
  }

  textChanged(var newValue) {
    setState(() {
      name = newValue;
    });
  }

  void nextPressed() {
    setState(() {
      _first = false;
    });
  }

  second() {
    var message = new Text(
      """
Hallo $name. Ich freue mich, Sie zu treffen.
"""
          .trim()
          .replaceAll("\n", " "),
      style: TextStyle(fontSize: 32),
      textAlign: TextAlign.center,
    );
    var finish = new FlatButton(
      onPressed: () => {SystemNavigator.pop()},
      child: const Text("Fertig"),
    );
    var children = [
      message,
      Visibility(
          child: Align(alignment: Alignment.centerRight, child: finish),
          visible: Theme.of(context).platform != TargetPlatform.iOS)
    ];
    return WillPopScope(
      child: Column(children: children),
      onWillPop: () {
        setState(() {
          _first = true;
          name = "";
        });
        return new Future(() => false);
      },
    );
  }
}
