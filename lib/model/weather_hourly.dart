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
        lat: json["lat"].toDouble(),
        lon: json["lon"].toDouble(),
        timezone: json["timezone"],
        timezoneOffset: json["timezone_offset"],
        hourly: List<Hourly>.from(json["hourly"].map((x) => Hourly.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "lat": lat,
        "lon": lon,
        "timezone": timezone,
        "timezone_offset": timezoneOffset,
        "hourly": List<dynamic>.from(hourly.map((x) => x.toJson())),
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
        dt: json["dt"],
        temp: json["temp"].toDouble(),
        feelsLike: json["feels_like"].toDouble(),
        pressure: json["pressure"],
        humidity: json["humidity"],
        dewPoint: json["dew_point"].toDouble(),
        uvi: json["uvi"].toDouble(),
        clouds: json["clouds"],
        visibility: json["visibility"],
        windSpeed: json["wind_speed"].toDouble(),
        windDeg: json["wind_deg"],
        windGust: json["wind_gust"].toDouble(),
        weather: List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
        pop: json["pop"].toDouble(),
        rain: json["rain"] == null ? null : Rain.fromJson(json["rain"]),
    );

    Map<String, dynamic> toJson() => {
        "dt": dt,
        "temp": temp,
        "feels_like": feelsLike,
        "pressure": pressure,
        "humidity": humidity,
        "dew_point": dewPoint,
        "uvi": uvi,
        "clouds": clouds,
        "visibility": visibility,
        "wind_speed": windSpeed,
        "wind_deg": windDeg,
        "wind_gust": windGust,
        "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
        "pop": pop,
        "rain": rain?.toJson(),
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
        the1H: json["1h"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "1h": the1H,
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
        id: json["id"],
        main: json["main"],
        description: json["description"],
        icon: json["icon"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "main": main,
        "description": description,
        "icon": icon,
    };
}
