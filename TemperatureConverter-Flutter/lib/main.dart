import 'package:flutter/material.dart';
import 'converter.dart';
import 'model.dart';

const _appName = 'Temperature Converter';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: _appName,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: _appName),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Model model = new Model();
  var _currentInput = const InputValue();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(config.title),
      ),
      body: new Column(children: <Widget>[
        new Row(children: <Widget>[
          new Expanded(
              child: new Input(
                  hintText: 'Temperature',
                  value: _currentInput,
                  onChanged: (input) => _currentInput = input)),
          new DropdownButton(
              items: createUnit(),
              onChanged: (temperatureUnit newValue) {
                setState(() {
                  model.inUnit = newValue;
                });
              },
              value: model.inUnit)
        ]),
        new Row(children: <Widget>[
          new Text("Convert to"),
          new DropdownButton(
              items: createUnit(),
              onChanged: (temperatureUnit newValue) {
                setState(() {
                  model.outUnit = newValue;
                });
              },
              value: model.outUnit),
        ]),
        new FlatButton(
            child: new Text('Calculate'),
            onPressed: () {
              setState(() {
                double inTemp = stringToDouble(_currentInput.text);
                model.inTemperature = inTemp;
                model.calculateOutTemperature();
              });
            }),
        new Text(model.outTemperatureAsString)
      ]), // This trailing comma tells the Dart formatter to use
      // a style that looks nicer for build methods.
    );
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
