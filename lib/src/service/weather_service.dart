import 'package:flutter/foundation.dart';
import 'package:weatherapp/src/api/api_repository.dart';
import 'package:weatherapp/src/model/current_weather_data.dart';
import 'package:weatherapp/src/model/five_days_data.dart';

class WeatherService {
  WeatherService({@required this.city});

  String apiKey = 'APPID=0bbde53c78eb8395f7ec67e62f72266a';
  String baseUrl = 'https://api.openweathermap.org/data/2.5';
  final String city;

  void getCurrentWeatherData({
    Function() beforSend,
    Function(CurrentWeatherData currentWeatherData) onSuccess,
    Function(dynamic error) onError,
  }) {
    final url = '$baseUrl/weather?q=$city&lang=en&$apiKey';
    //print(url);
    ApiRepository(url: '$url', payload: null).get(
        beforeSend: () => {
              if (beforSend != null)
                {
                  beforSend(),
                },
            },
        onSuccess: (data) => {
              onSuccess(CurrentWeatherData.fromJson(data)),
            },
        onError: (error) => {
              if (onError != null)
                {
                  print(error),
                  onError(error),
                }
            });
  }

  void getFiveDaysThreeHoursForcastData({
    Function() beforSend,
    Function(List<FiveDayData> fiveDayData) onSuccess,
    Function(dynamic error) onError,
  }) {
    final url = '$baseUrl/forecast?q=$city&lang=en&$apiKey';
    print(url);
    ApiRepository(url: '$url', payload: null).get(
        beforeSend: () => {},
        onSuccess: (data) => {
              onSuccess((data['list'] as List)
                      ?.map((t) => FiveDayData.fromJson(t))
                      ?.toList() ??
                  List.empty()),
            },
        onError: (error) => {
              print(error),
              onError(error),
            });
  }
}
