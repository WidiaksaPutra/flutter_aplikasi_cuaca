import 'package:aplikasi_cuaca/model/weather_daily.dart';
import 'package:aplikasi_cuaca/model/weather_hourly.dart';
import 'package:aplikasi_cuaca/model/weather_now.dart';
import 'package:aplikasi_cuaca/service/api.dart';
import 'package:geolocator/geolocator.dart';

mixin Geolocation{
  final APIWeather _apiWeather = APIWeather();
  WeatherNow? weatherNow;
  WeatherHourly? weatherHour;
  WeatherDaily? weatherDaily;
  // late String _latitude = "-8.7982674";
  // late String _longitude = "115.1702034";
  late double _latitude;
  late double _longitude;

  // Future<double> getPosition({ String? latitude, String? longitude}) async {
  //   LocationPermission permission;
  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     return 0.0;
  //   }
  //   else{
  //     Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
  //     if(latitude == "lat"){
  //       _latitude = position.latitude;
  //       // print("test");
  //       // print(_latitude);
  //       return _latitude;
  //     } 
  //     else{
  //       _longitude = position.longitude;
  //       return _longitude;
  //     }
  //   }
  // }

  

  Future<WeatherNow> getDataWeatherNow() async { 
     LocationPermission permission;
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        return weatherNow = await _apiWeather.fetchDataWeatherNow(lat : "-8.7982674" , lon : "-8.7982674");
      }
      else{
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
        _latitude = position.latitude;
        _longitude = position.longitude;
        // print(_latitude);
        // print(_longitude);
    // return weatherNow = await _apiWeather.fetchDataWeatherNow(lat : getPosition(latitude: 'lat').toString(), lon : getPosition(longitude: 'long').toString());
       return weatherNow = await _apiWeather.fetchDataWeatherNow(lat : _latitude.toString() , lon : _longitude.toString());
      }
  }

  Future<WeatherHourly> getDataWeatherHourly() async {
    LocationPermission permission;
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        return weatherHour = await _apiWeather.fetchDataWeatherHourly(lat : "-8.7982674" , lon : "-8.7982674");
      }
      else{
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
        _latitude = position.latitude;
        _longitude = position.longitude;
      return weatherHour = await _apiWeather.fetchDataWeatherHourly(lat : _latitude.toString(), lon : _longitude.toString());  
      }// return weatherHour = await _apiWeather.fetchDataWeatherHourly(lat : "${getPosition(latitude: 'lat')}", lon : "${getPosition(longitude: 'long')}");
  }

  Future<WeatherDaily> getDataWeatherDaily() async{
   LocationPermission permission;
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        return weatherDaily = await _apiWeather.fetchDataWeatherDaily(lat : "-8.7982674" , lon : "-8.7982674");
      }
      else{
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
        _latitude = position.latitude;
        _longitude = position.longitude;
      return weatherDaily = await _apiWeather.fetchDataWeatherDaily(lat : _latitude.toString(), lon : _longitude.toString());
    // return weatherDaily = await _apiWeather.fetchDataWeatherDaily(lat : "${getPosition(latitude: 'lat')}", lon : "${getPosition(longitude: 'long')}");
      }
  }
}

