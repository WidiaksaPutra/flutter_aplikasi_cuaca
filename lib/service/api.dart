import 'dart:convert';

import 'package:aplikasi_cuaca/model/weather_daily.dart';
import 'package:aplikasi_cuaca/model/weather_hourly.dart';
import 'package:aplikasi_cuaca/model/weather_now.dart';
import 'package:http/http.dart' as http;

class APIWeather{
 
  Future<WeatherNow> fetchDataWeatherNow({required String lat , required String lon}) async {
    //https://api.openweathermap.org/data/2.5/weather?lat=-8.7982674&lon=115.1702034&appid=45865970ebbfbc127eb2a16dd7f753e7&units=metric
    try {
        final queryParameters = {
          'lat' : lat,
          'lon' : lon,
          'appid' : '45865970ebbfbc127eb2a16dd7f753e7',
          'units' : 'metric'
        };
        final uri = Uri.https("api.openweathermap.org", "/data/2.5/weather", queryParameters);
        final response = await http.get(uri);
        if(response.statusCode == 200){
          return WeatherNow.fromJson(jsonDecode(response.body));
        } else{
          throw Exception('failed to load data weather');
        }
    } catch (e) {
      rethrow;
    }
  }

  Future<WeatherHourly> fetchDataWeatherHourly({required String lat , required String lon}) async {
    //https://api.openweathermap.org/data/2.5/onecall?lat=-8.7982674&lon=115.1702034&exclude=current,minutely,daily,alerts&appid=45865970ebbfbc127eb2a16dd7f753e7&units=metric
    try {
        final queryParameters = {
          'lat' : lat,
          'lon' : lon,
          'exclude' : 'current,minutely,daily,alerts',
          'appid' : '45865970ebbfbc127eb2a16dd7f753e7',
          'units' : 'metric'
        };
        final uri = Uri.https("api.openweathermap.org", "/data/2.5/onecall", queryParameters);
        final response = await http.get(uri);
        if(response.statusCode == 200){
          return WeatherHourly.fromJson(jsonDecode(response.body));
        } else{
          throw Exception('failed to load data weather');
        }
    } catch (e) {
      rethrow;
    }
  }

  Future<WeatherDaily> fetchDataWeatherDaily({required String lat , required String lon}) async {
    //https://api.openweathermap.org/data/2.5/onecall?lat=-8.7982674&lon=115.1702034&exclude=current,minutely,hourly,alerts&appid=45865970ebbfbc127eb2a16dd7f753e7&units=metric
    try {
        final queryParameters = {
          'lat' : lat,
          'lon' : lon,
          'exclude' : 'current,minutely,hourly,alerts',
          'appid' : '45865970ebbfbc127eb2a16dd7f753e7',
          'units' : 'metric'
        };
        final uri = Uri.https("api.openweathermap.org", "/data/2.5/onecall", queryParameters);
        final response = await http.get(uri);
        if(response.statusCode == 200){
          return WeatherDaily.fromJson(jsonDecode(response.body));
        } else{
          throw Exception('failed to load data weather');
        }
    } catch (e) {
      rethrow;
    }
  }
}