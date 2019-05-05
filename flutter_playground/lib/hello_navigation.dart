import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  var _title = 'Hello Navigation';
  runApp(MaterialApp(
    title: _title,
    home: FirstRoute(title: _title),
  ));
}

class FirstRoute extends StatefulWidget {
  final String title;

  FirstRoute({Key key, this.title}) : super(key: key);

  @override
  FirstRouteState createState() => FirstRouteState();
}

class FirstRouteState extends State<FirstRoute> {
  String name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Padding(padding: EdgeInsets.all(8.0), child: first()));
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

  void nextPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SecondRoute(name: name, title: widget.title)),
    );
  }

  textChanged(var newValue) {
    setState(() {
      name = newValue;
    });
  }
}

class SecondRoute extends StatelessWidget {
  final String name;
  final String title;

  SecondRoute({Key key, @required this.name, @required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Padding(padding: EdgeInsets.all(8.0), child: second(context)));
  }

  second(var context) {
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
    return Column(children: children);
  }
}
