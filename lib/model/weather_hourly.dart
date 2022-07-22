// To parse this JSON data, do
//
//     final weatherHourly = weatherHourlyFromJson(jsonString);

import 'dart:convert';

class WeatherHourly {
    WeatherHourly({
        this.lat,
        this.lon,
        this.timezone,
        this.timezoneOffset,
        required this.hourly,
    });

    final double? lat;
    final double? lon;
    final String? timezone;
    final int? timezoneOffset;
    final List<Hourly> hourly;

    factory WeatherHourly.fromRawJson(String str) => WeatherHourly.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory WeatherHourly.fromJson(Map<String, dynamic> json) => WeatherHourly(
        lat: json["lat"] == null ? 0.0 : json["lat"].toDouble(),
        lon: json["lon"] == null ? 0.0 : json["lon"].toDouble(),
        timezone: json["timezone"] == null ? "-" : json["timezone"].toString(),
        timezoneOffset: json["timezone_offset"] == null ? 0 : json["timezone_offset"].toInt(),
        hourly: json["hourly"] == List.empty() ? [] : List<Hourly>.from(json["hourly"].map((x) => Hourly.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "lat": lat == null ? 0.0 : lat?.toDouble(),
        "lon": lon == null ? 0.0 : lon?.toDouble(),
        "timezone": timezone == null ? "-" : timezone.toString(),
        "timezone_offset": timezoneOffset == null ? 0 : timezoneOffset?.toInt(),
        "hourly": hourly == List.empty() ? [] : List<dynamic>.from(hourly.map((x) => x.toJson())),
    };
}

class Hourly {
    Hourly({
        this.dt,
        this.temp,
        this.feelsLike,
        this.pressure,
        this.humidity,
        this.dewPoint,
        this.uvi,
        this.clouds,
        this.visibility,
        this.windSpeed,
        this.windDeg,
        this.windGust,
        required this.weather,
        this.pop,
        this.rain,
    });

    final int? dt;
    final double? temp;
    final double? feelsLike;
    final int? pressure;
    final int? humidity;
    final double? dewPoint;
    final double? uvi;
    final int? clouds;
    final int? visibility;
    final double? windSpeed;
    final int? windDeg;
    final double? windGust;
    final List<Weather> weather;
    final double? pop;
    final Rain? rain;

    factory Hourly.fromRawJson(String str) => Hourly.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Hourly.fromJson(Map<String, dynamic> json) => Hourly(
        dt: json["dt"] == null ? 0 : json["dt"].toInt(),
        temp: json["temp"] == null ? 0.0 : json["temp"].toDouble(),
        feelsLike: json["feels_like"] == null ? 0.0 : json["feels_like"].toDouble(),
        pressure: json["pressure"] == null ? 0 : json["pressure"].toInt(),
        humidity: json["humidity"] == null ? 0 : json["humidity"].toInt(),
        dewPoint: json["dew_point"] == null ? 0.0 : json["dew_point"].toDouble(),
        uvi: json["uvi"] == null ? 0.0 : json["uvi"].toDouble(),
        clouds: json["clouds"] == null ? 0 : json["clouds"].toInt(),
        visibility: json["visibility"] == null ? 0 : json["visibility"].toInt(),
        windSpeed: json["wind_speed"] == null ? 0.0 : json["wind_speed"].toDouble(),
        windDeg: json["wind_deg"] == null ? 0 : json["wind_deg"].toInt(),
        windGust: json["wind_gust"] == null ? 0.0 : json["wind_gust"].toDouble(),
        weather: json["weather"] == List.empty() ? [] : List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
        pop: json["pop"] == null ? 0.0 : json["pop"].toDouble(),
        rain: json["rain"] == null ? null : Rain.fromJson(json["rain"]),
    );

    Map<String, dynamic> toJson() => {
        "dt": dt == null ? 0 : dt?.toInt(),
        "temp": temp == null ? 0.0 : temp?.toDouble(),
        "feels_like": feelsLike == null ? 0.0 : feelsLike?.toDouble(),
        "pressure": pressure == null ? 0 : pressure?.toInt(),
        "humidity": humidity == null ? 0 : humidity?.toInt(),
        "dew_point": dewPoint == null ? 0.0 : dewPoint?.toDouble(),
        "uvi": uvi == null ? 0.0 : uvi?.toDouble(),
        "clouds": clouds == null ? 0 : clouds?.toInt(),
        "visibility": visibility == null ? 0 : visibility?.toInt(),
        "wind_speed": windSpeed == null ? 0.0 : windSpeed?.toDouble(),
        "wind_deg": windDeg == null ? 0 : windDeg?.toInt(),
        "wind_gust": windGust == null ? 0.0 : windGust?.toDouble(),
        "weather": weather == List.empty() ? [] : List<dynamic>.from(weather.map((x) => x.toJson())),
        "pop": pop == null ? 0.0 : pop?.toDouble(),
        "rain": rain == null ? 0.0 : rain?.toJson(),
    };
}

class Rain {
    Rain({
        this.the1H,
    });

    final double? the1H;

    factory Rain.fromRawJson(String str) => Rain.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Rain.fromJson(Map<String, dynamic> json) => Rain(
        the1H: json["1h"] == null ? 0.0 : json["1h"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "1h": the1H == null ? 0.0 : the1H?.toDouble(),
    };
}

class Weather {
    Weather({
        this.id,
        this.main,
        this.description,
        this.icon,
    });

    final int? id;
    final String? main;
    final String? description;
    final String? icon;

    factory Weather.fromRawJson(String str) => Weather.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json["id"] == null ? 0 : json["id"].toInt(),
        main: json["main"] == null ? "-" : json["main"].toString(),
        description: json["description"] == null ? "-" : json["description"].toString(),
        icon: json["icon"] == null ? "-" : json["icon"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? 0 : id?.toInt(),
        "main": main == null ? "-" : main.toString(),
        "description": description == null ? "-" : description.toString(),
        "icon": icon == null ? "-" : icon.toString(),
    };
}
