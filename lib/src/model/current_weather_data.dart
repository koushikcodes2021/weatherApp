import 'package:weatherapp/src/model/clouds.dart';
import 'package:weatherapp/src/model/coord.dart';
import 'package:weatherapp/src/model/main_weather.dart';
import 'package:weatherapp/src/model/sys.dart';
import 'package:weatherapp/src/model/weather.dart';
import 'package:weatherapp/src/model/wind.dart';

class CurrentWeatherData {
  CurrentWeatherData(
      {this.coord,
      this.weather,
      this.base,
      this.main,
      this.visibility,
      this.wind,
      this.clouds,
      this.dt,
      this.sys,
      this.timezone,
      this.id,
      this.name,
      this.cod});

  factory CurrentWeatherData.fromJson(dynamic json) {
    if (json == null) {
      return CurrentWeatherData();
    }

    return CurrentWeatherData(
      coord: Coord.fromJson(json['coord']),
      weather: (json['weather'] as List)
              ?.map((w) => Weather.fromJson(w))
              ?.toList() ??
          List.empty(),
      base: json['base'],
      main: MainWeather.fromJson(json['main']),
      visibility: json['visibility'],
      wind: Wind.fromJson(json['wind']),
      clouds: Clouds.fromJson(json['clouds']),
      dt: json['dt'],
      sys: Sys.fromJson(json['sys']),
      timezone: json['timezone'],
      id: json['id'],
      name: json['name'],
      cod: json['cod'],
    );
  }

  final String base;
  final Clouds clouds;
  final int cod;
  final Coord coord;
  final int dt;
  final int id;
  final MainWeather main;
  final String name;
  final Sys sys;
  final int timezone;
  final int visibility;
  final List<Weather> weather;
  final Wind wind;
}
