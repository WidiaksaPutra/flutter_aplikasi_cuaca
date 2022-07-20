// To parse this JSON data, do
//
//     final weatherDaily = weatherDailyFromJson(jsonString);

import 'dart:convert';

class WeatherDaily {
    WeatherDaily({
        this.lat,
        this.lon,
        this.timezone,
        this.timezoneOffset,
        required this.daily,
    });

    final double? lat;
    final double? lon;
    final String? timezone;
    final int? timezoneOffset;
    final List<Daily> daily;

    factory WeatherDaily.fromRawJson(String str) => WeatherDaily.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory WeatherDaily.fromJson(Map<String, dynamic> json) => WeatherDaily(
        lat: json["lat"].toDouble(),
        lon: json["lon"].toDouble(),
        timezone: json["timezone"],
        timezoneOffset: json["timezone_offset"],
        daily: List<Daily>.from(json["daily"].map((x) => Daily.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "lat": lat,
        "lon": lon,
        "timezone": timezone,
        "timezone_offset": timezoneOffset,
        "daily": List<dynamic>.from(daily.map((x) => x.toJson())),
    };
}

class Daily {
    Daily({
        this.dt,
        this.clouds,
        this.sunrise,
        this.sunset,
        this.moonrise,
        this.moonset,
        this.moonPhase,
        this.temp,
        this.feelsLike,
        this.pressure,
        this.humidity,
        this.dewPoint,
        this.windSpeed,
        this.windDeg,
        this.windGust,
        required this.weather,
        this.pop,
        this.rain,
        this.uvi,
    });

    final int? dt;
    final int? clouds;
    final int? sunrise;
    final int? sunset;
    final int? moonrise;
    final int? moonset;
    final double? moonPhase;
    final Temp? temp;
    final FeelsLike? feelsLike;
    final int? pressure;
    final int? humidity;
    final double? dewPoint;
    final double? windSpeed;
    final int? windDeg;
    final double? windGust;
    final List<Weather> weather;
    final double? pop;
    final double? rain;
    final double? uvi;

    factory Daily.fromRawJson(String str) => Daily.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        dt: json["dt"],
        clouds: json["clouds"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
        moonrise: json["moonrise"],
        moonset: json["moonset"],
        moonPhase: json["moon_phase"] == null ? 0.0 : json["moon_phase"].toDouble(),
        temp: json["temp"] == null ? null : Temp.fromJson(json["temp"]),
        feelsLike: json["feels_like"] == null ? null : FeelsLike.fromJson(json["feels_like"]),
        pressure: json["pressure"],
        humidity: json["humidity"],
        dewPoint: json["dew_point"] == null ? 0.0: json["dew_point"].toDouble(),
        windSpeed: json["wind_speed"] == null ? 0.0 : json["wind_speed"].toDouble(),
        windDeg: json["wind_deg"],
        windGust: json["wind_gust"] == null ? 0.0 : json["wind_gust"].toDouble(),
        weather: List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
        pop: json["pop"] == null ? 0.0 : json["pop"].toDouble(),
        rain: json["rain"] == null ? 0.0 : json["rain"].toDouble(),
        uvi: json["uvi"] == null ? 0.0 : json["uvi"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "dt": dt,
        "clouds": clouds,
        "sunrise": sunrise,
        "sunset": sunset,
        "moonrise": moonrise,
        "moonset": moonset,
        "moon_phase": moonPhase,
        "temp": temp?.toJson(),
        "feels_like": feelsLike?.toJson(),
        "pressure": pressure,
        "humidity": humidity,
        "dew_point": dewPoint,
        "wind_speed": windSpeed,
        "wind_deg": windDeg,
        "wind_gust": windGust,
        "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
        "pop": pop,
        "rain": rain,
        "uvi": uvi,
    };
}

class FeelsLike {
    FeelsLike({
        this.day,
        this.night,
        this.eve,
        this.morn,
    });

    final double? day;
    final double? night;
    final double? eve;
    final double? morn;

    factory FeelsLike.fromRawJson(String str) => FeelsLike.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory FeelsLike.fromJson(Map<String, dynamic> json) => FeelsLike(
        day: json["day"].toDouble(),
        night: json["night"].toDouble(),
        eve: json["eve"].toDouble(),
        morn: json["morn"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "day": day,
        "night": night,
        "eve": eve,
        "morn": morn,
    };
}

class Temp {
    Temp({
        this.day,
        this.min,
        this.max,
        this.night,
        this.eve,
        this.morn,
    });

    final double? day;
    final double? min;
    final double? max;
    final double? night;
    final double? eve;
    final double? morn;

    factory Temp.fromRawJson(String str) => Temp.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Temp.fromJson(Map<String, dynamic> json) => Temp(
        day: json["day"].toDouble(),
        min: json["min"].toDouble(),
        max: json["max"].toDouble(),
        night: json["night"].toDouble(),
        eve: json["eve"].toDouble(),
        morn: json["morn"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "day": day,
        "min": min,
        "max": max,
        "night": night,
        "eve": eve,
        "morn": morn,
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
