// Copyright (c) 2017, Thomas Kuenneth.
// All rights reserved. Use of this source code is governed by the
// GNU General Public license version 3 that can be found in the LICENSE file.

import 'dart:html';

import 'package:temperatureconverter/src/model.dart';
import 'package:temperatureconverter/src/converter.dart';

final Model _model = new Model();

Element _result;
InputElement _input;
InputElement _button;

main() {
  _result = querySelector('#result');
  _input = querySelector('#temperature');
  _input.onInput.listen(onInput);
  _input.focus();
  _button = querySelector("#submitForm");
  _button.onClick.listen(submitForm);
  _enableOrDisAble();
}

void onInput(Event e) {
  _enableOrDisAble();
}

void submitForm(Event e) {
  e.preventDefault(); // Don't do the default submit.

  String stringTemp = _input.value;
  try {
    double temp = stringToDouble(stringTemp);
    _model.inTemperature = temp;
  } on FormatException catch (ex) {
    _result.text = "wrong number format";
    return;
  }

  InputElement inUnit = querySelector('input[name = "inUnit"]:checked');
  _model.inUnit = enumFor(inUnit.value);

  InputElement outUnit = querySelector('input[name = "outUnit"]:checked');
  _model.outUnit = enumFor(outUnit.value);

  _model.calculateOutTemperature();
  _result.text = _model.outTemperatureAsString;

  _input.focus();
}

_enableOrDisAble() {
  _button.disabled = _input.value.length == 0;
}
