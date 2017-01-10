/*
 * converter.dart
 *
 * Copyright 2017 Thomas Kuenneth
 *
 * This file is part of TemperatureConverter.
 *
 * TemperatureConverter is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
library converter;

const String DEGREES_CELSIUS = "\u00B0C";
const String DEGREES_FAHRENHEIT = "\u00B0F";
const String KELVIN = "K";

double stringToDouble(String s) => double.parse(s);

double celsiusToKelvin(double celsius) => 273.15 + celsius;

double fahrenheitToKelvin(double fahrenheit) => (fahrenheit + 459.67) * 5 / 9;

double kelvinToCelsius(double kelvin) => kelvin - 273.15;

double kelvinToFahrenheit(double kelvin) => kelvin * 1.8 - 459.67;

double celsiusToFahrenheit(double celsius) => (celsius * 1.8) + 32;

double fahrenheitToCelsius(double fahrenheit) => (fahrenheit - 32) * 5 / 9;

String celsiusToString(double celsius) => doubleToString(celsius, DEGREES_CELSIUS);

String fahrenheitToString(double fahrenheit) => doubleToString(fahrenheit, DEGREES_FAHRENHEIT);

String kelvinToString(double kelvin) => doubleToString(kelvin, KELVIN);

String doubleToString(double val, String suffix) {
  var rounded = val.round();
  return "${val == rounded ? rounded : val} $suffix";
}
