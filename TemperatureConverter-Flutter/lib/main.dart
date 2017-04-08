import 'package:flutter/material.dart';
import 'converter.dart';
import 'model.dart';

const _appName = 'Temperature Converter';
const _temperature = 'Temperature';
const EdgeInsets edgeInsetsLeftOnly =
const EdgeInsets.fromLTRB(18.0, 0.0, 0.0, 0.0);
const _calculate = 'Calculate';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: _appName,
      home: new MyHomePage(title: _appName),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Model model = new Model();
  String strTemperature;

  @override
  Widget build(BuildContext context) {
    final calculate = new FlatButton(
        child: new Text(_calculate),
        onPressed: () {
          setState(() {
            model.inTemperature = stringToDouble(strTemperature);
            model.calculateOutTemperature();
          });
        });
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(config.title),
        ),
        body: new Container(
          padding: new EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
          child: new Column(children: <Widget>[
            new Row(children: <Widget>[
              new Expanded(
                  child: new TextField(
                      decoration: new InputDecoration(hintText: _temperature),
                      onChanged: (newValue) {
                        setState(() {
                          strTemperature = newValue.trim();
                          // calculate.enabled = strTemperature.length > 0;
                        });
                      })),
              new Container(
                  padding: edgeInsetsLeftOnly,
                  child: new DropdownButton<temperatureUnit>(
                      items: createUnit(),
                      onChanged: (temperatureUnit newValue) {
                        setState(() {
                          model.inUnit = newValue;
                        });
                      },
                      value: model.inUnit))
            ]),
            new Row(children: <Widget>[
              new Text("Convert to"),
              new Container(
                  padding: edgeInsetsLeftOnly,
                  child: new DropdownButton<temperatureUnit>(
                      items: createUnit(),
                      onChanged: (temperatureUnit newValue) {
                        setState(() {
                          model.outUnit = newValue;
                        });
                      },
                      value: model.outUnit)),
            ]),
            calculate,
            new Text(model.outTemperatureAsString)
          ]),
        ));
  }

  List<DropdownMenuItem> createUnit() {
    var l = new List<DropdownMenuItem<temperatureUnit>>();
    // degrees Celsius
    l.add(new DropdownMenuItem<temperatureUnit>(
        value: temperatureUnit.degreesCelsius,
        child: new Text(unitDegreesCelsius)));
    // degrees Fahrenheit
    l.add(new DropdownMenuItem<temperatureUnit>(
        value: temperatureUnit.degreesFahrenheit,
        child: new Text(unitDegreesFahrenheit)));
    // Kelvin
    l.add(new DropdownMenuItem<temperatureUnit>(
        value: temperatureUnit.kelvin, child: new Text(unitKelvin)));
    return l;
  }
}
