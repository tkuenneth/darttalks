import 'package:temperatureconverter/src/converter.dart';

main(List<String> args) {
  for (var arg in args) {
    var d = stringToDouble(arg);
    print("${celsiusToString(d)} = ${fahrenheitToString(celsiusToFahrenheit(d))}");
    print("${celsiusToString(d)} = ${kelvinToString(celsiusToKelvin(d))}");

    print("${fahrenheitToString(d)} = ${celsiusToString(fahrenheitToCelsius(d))}");
    print("${fahrenheitToString(d)} = ${kelvinToString(fahrenheitToKelvin(d))}");

    print("${kelvinToString(d)} = ${celsiusToString(kelvinToCelsius(d))}");
    print("${kelvinToString(d)} = ${fahrenheitToString(kelvinToFahrenheit(d))}");
  }
}
