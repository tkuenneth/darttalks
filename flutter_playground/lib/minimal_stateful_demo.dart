import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(
    Center(child: FlipFlop()),
  );
}

class FlipFlop extends StatefulWidget {
  const FlipFlop({Key key}) : super(key: key);

  @override
  _FlipFlopState createState() => _FlipFlopState();
}

class _FlipFlopState extends State<FlipFlop> {
  int counter = 0;
  bool white = true;

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 1), () {
      setState(() {
        white = !white;
        print("setState() called ${++counter} times");
      });
    });
    var col = white ? 0xffffffff : 0xffa0a0a0;
    return Container(color: Color(col));
  }
}
