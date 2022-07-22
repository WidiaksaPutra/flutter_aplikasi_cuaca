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
        lat: json["lat"] == null ? 0.0 : json["lat"].toDouble(),
        lon: json["lon"] == null ? 0.0 : json["lon"].toDouble(),
        timezone: json["timezone"] == null ? "-" : json["timezone"].toString(),
        timezoneOffset: json["timezone_offset"] == null ? 0 : json["timezone_offset"].toInt(),
        daily: json["daily"] == List.empty() ? [] : List<Daily>.from(json["daily"].map((x) => Daily.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "lat": lat == null ? 0.0 : lat?.toDouble(),
        "lon": lon == null ? 0.0 : lon?.toDouble(),
        "timezone": timezone == null ? "-" : timezone.toString(),
        "timezone_offset": timezoneOffset == null ? 0 : timezoneOffset?.toInt(),
        "daily": daily == List.empty() ? [] : List<dynamic>.from(daily.map((x) => x.toJson())),
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
        dt: json["dt"] == null ? 0 : json["dt"].toInt(),
        clouds: json["clouds"] == null ? 0 : json["clouds"].toInt(),
        sunrise: json["sunrise"] == null ? 0 : json["sunrise"].toInt(),
        sunset: json["sunset"] == null ? 0 : json["sunset"].toInt(),
        moonrise: json["moonrise"] == null ? 0 : json["moonrise"].toInt(),
        moonset: json["moonset"] == null ? 0 : json["moonset"].toInt(),
        moonPhase: json["moon_phase"] == null ? 0.0 : json["moon_phase"].toDouble(),
        temp: json["temp"] == null ? null : Temp.fromJson(json["temp"]),
        feelsLike: json["feels_like"] == null ? null : FeelsLike.fromJson(json["feels_like"]),
        pressure: json["pressure"] == null ? 0 : json["pressure"].toInt(),
        humidity: json["humidity"] == null ? 0 : json["humidity"].toInt(),
        dewPoint: json["dew_point"] == null ? 0.0: json["dew_point"].toDouble(),
        windSpeed: json["wind_speed"] == null ? 0.0 : json["wind_speed"].toDouble(),
        windDeg: json["wind_deg"] == null ? 0 : json["wind_deg"].toInt(),
        windGust: json["wind_gust"] == null ? 0.0 : json["wind_gust"].toDouble(),
        weather: json["weather"] == List.empty() ? [] : List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
        pop: json["pop"] == null ? 0.0 : json["pop"].toDouble(),
        rain: json["rain"] == null ? 0.0 : json["rain"].toDouble(),
        uvi: json["uvi"] == null ? 0.0 : json["uvi"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "dt": dt == null ? 0 : dt?.toInt(),
        "clouds": clouds == null ? 0 : clouds?.toInt(),
        "sunrise": sunrise == null ? 0 : sunrise?.toInt(),
        "sunset": sunset == null ? 0 : sunset?.toInt(),
        "moonrise": moonrise == null ? 0 : moonrise?.toInt(),
        "moonset": moonset == null ? 0 : moonset?.toInt(),
        "moon_phase": moonPhase == null ? 0.0 : moonPhase?.toDouble(),
        "temp": temp == null ? 0.0 : temp?.toJson(),
        "feels_like": feelsLike == null ? 0.0 : feelsLike?.toJson(),
        "pressure": pressure == null ? 0 : pressure?.toInt(),
        "humidity": humidity == null ? 0 : humidity?.toInt(),
        "dew_point": dewPoint == null ? 0.0 : dewPoint?.toDouble(),
        "wind_speed": windSpeed == null ? 0.0 : windSpeed?.toDouble(),
        "wind_deg": windDeg == null ? 0 : windDeg?.toInt(),
        "wind_gust": windGust == null ? 0.0 : windGust?.toDouble(),
        "weather": weather == List.empty() ? [] : List<dynamic>.from(weather.map((x) => x.toJson())),
        "pop": pop == null ? 0.0 : pop?.toDouble(),
        "rain": rain == null ? 0.0 : rain?.toDouble(),
        "uvi": uvi == null ? 0.0 : uvi?.toDouble(),
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
        day: json["day"] == null ? 0.0 : json["day"].toDouble(),
        night: json["night"] == null ? 0.0 : json["night"].toDouble(),
        eve: json["eve"] == null ? 0.0 : json["eve"].toDouble(),
        morn: json["morn"] == null ? 0.0 : json["morn"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "day": day == null ? 0.0 : day?.toDouble(),
        "night": night == null ? 0.0 : night?.toDouble(),
        "eve": eve == null ? 0.0 : eve?.toDouble(),
        "morn": morn == null ? 0.0 : morn?.toDouble(),
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
        day: json["day"] == null ? 0.0 : json["day"].toDouble(),
        min: json["min"] == null ? 0.0 : json["min"].toDouble(),
        max: json["max"] == null ? 0.0 : json["max"].toDouble(),
        night: json["night"] == null ? 0.0 : json["night"].toDouble(),
        eve: json["eve"] == null ? 0.0 : json["eve"].toDouble(),
        morn: json["morn"] == null ? 0.0 : json["morn"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "day": day == null ? 0.0 : day?.toDouble(),
        "min": min == null ? 0.0 : min?.toDouble(),
        "max": max == null ? 0.0 : max?.toDouble(),
        "night": night == null ? 0.0 : night?.toDouble(),
        "eve": eve == null ? 0.0 : eve?.toDouble(),
        "morn": morn == null ? 0.0 : morn?.toDouble(),
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
