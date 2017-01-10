import 'package:temperatureconverter/converter.dart';

main(List<String> args) {
  for (var arg in args) {
    var d = stringToDouble(arg);
    print("${celsiusToString(d)} = ${celsiusToFahrenheit(d)} $DEGREES_FAHRENHEIT");
    print("${celsiusToString(d)} = ${celsiusToKelvin(d)} $KELVIN");

    print("${fahrenheitToString(d)} = ${fahrenheitToCelsius(d)} $DEGREES_CELSIUS");
    print("${fahrenheitToString(d)} = ${fahrenheitToKelvin(d)} $KELVIN");

    print("${kelvinToString(d)} = ${kelvinToCelsius(d)} $DEGREES_CELSIUS");
    print("${kelvinToString(d)} = ${kelvinToFahrenheit(d)} $DEGREES_FAHRENHEIT");
  }
}
