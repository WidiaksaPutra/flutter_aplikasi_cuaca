// To parse this JSON data, do
//
//     final weatherNow = weatherNowFromJson(jsonString);

import 'dart:convert';

class WeatherNow {
    WeatherNow({
        this.coord,
        required this.weather,
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
        this.cod,
    });

    final Coord? coord;
    final List<Weather> weather;
    final String? base;
    final Main? main;
    final int? visibility;
    final Wind? wind;
    final Clouds? clouds;
    final int? dt;
    final Sys? sys;
    final int? timezone;
    final int? id;
    final String? name;
    final int? cod;

    factory WeatherNow.fromRawJson(String str) => WeatherNow.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory WeatherNow.fromJson(Map<String, dynamic> json) => WeatherNow(
        coord: json["coord"] == null ? null : Coord.fromJson(json["coord"]),
        weather: json["weather"] == List.empty() ? [] : List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
        base: json["base"] == null ? "-" : json["base"].toString(),
        main: json["main"] == null ? null : Main.fromJson(json["main"]),
        visibility: json["visibility"] == null ? 0 : json["visibility"].toInt(),
        wind: json["wind"] == null ? null : Wind.fromJson(json["wind"]),
        clouds: json["clouds"] == null ? null : Clouds.fromJson(json["clouds"]),
        dt: json["dt"] == null ? 0 : json["dt"].toInt(),
        sys: json["sys"] == null ? null : Sys.fromJson(json["sys"]),
        timezone: json["timezone"] == null ? 0 : json["timezone"].toInt(),
        id: json["id"] == null ? 0 : json["id"].toInt(),
        name: json["name"] == null ? "-" : json["name"].toString(),
        cod: json["cod"] == null ? 0 : json["cod"].toInt(),
    );

    Map<String, dynamic> toJson() => {
        "coord": coord == null ? "-" : coord?.toJson(),
        "weather": weather == List.empty() ? [] : List<dynamic>.from(weather.map((x) => x.toJson())),
        "base": base == null ? "-" : base.toString(),
        "main": main == null ? "-": main?.toJson(),
        "visibility": visibility == null ? 0 : visibility?.toInt(),
        "wind": wind == null ? "-" : wind?.toJson(),
        "clouds": clouds == null ? "-" : clouds?.toJson(),
        "dt": dt == null ? 0 : dt?.toInt(),
        "sys": sys == null ? "-" : sys?.toJson(),
        "timezone": timezone == null ? 0 : timezone?.toInt(),
        "id": id == null ? 0 : id?.toInt(),
        "name": name == null ? "-" : name.toString(),
        "cod": cod == null ? 0 : cod?.toInt(),
    };
}

class Clouds {
    Clouds({
        this.all,
    });

    final int? all;

    factory Clouds.fromRawJson(String str) => Clouds.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
        all: json["all"] == null ? 0 : json["all"].toInt(),
    );

    Map<String, dynamic> toJson() => {
        "all": all == null ? 0 : all?.toInt(),
    };
}

class Coord {
    Coord({
        this.lon,
        this.lat,
    });

    final double? lon;
    final double? lat;

    factory Coord.fromRawJson(String str) => Coord.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        lon: json["lon"] == null ? 0.0 : json["lon"].toDouble(),
        lat: json["lat"] == null ? 0.0 : json["lat"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "lon": lon == null ? 0.0 : lon?.toDouble(),
        "lat": lat == null ? 0.0 : lat?.toDouble(),
    };
}

class Main {
    Main({
        this.temp,
        this.feelsLike,
        this.tempMin,
        this.tempMax,
        this.pressure,
        this.humidity,
    });

    final double? temp;
    final double? feelsLike;
    final double? tempMin;
    final double? tempMax;
    final int? pressure;
    final int? humidity;

    factory Main.fromRawJson(String str) => Main.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Main.fromJson(Map<String, dynamic> json) => Main(
        temp: json["temp"] == null ? 0.0 : json["temp"].toDouble(),
        feelsLike: json["feels_like"] == null ? 0.0 : json["feels_like"].toDouble(),
        tempMin: json["temp_min"] == null ? 0.0 : json["temp_min"].toDouble(),
        tempMax: json["temp_max"] == null ? 0.0 : json["temp_max"].toDouble(),
        pressure: json["pressure"] == null ? 0 : json["pressure"].toInt(),
        humidity: json["humidity"] == null ? 0 : json["humidity"].toInt(),
    );

    Map<String, dynamic> toJson() => {
        "temp": temp == null ? 0.0 : temp?.toDouble(),
        "feels_like": feelsLike == null ? 0.0 : feelsLike?.toDouble(),
        "temp_min": tempMin == null ? 0.0 : tempMin?.toDouble(),
        "temp_max": tempMax == null ? 0.0 : tempMax?.toDouble(),
        "pressure": pressure == null ? 0 : pressure?.toInt(),
        "humidity": humidity == null ? 0 : humidity?.toInt(),
    };
}

class Sys {
    Sys({
        this.type,
        this.id,
        this.country,
        this.sunrise,
        this.sunset,
    });

    final int? type;
    final int? id;
    final String? country;
    final int? sunrise;
    final int? sunset;

    factory Sys.fromRawJson(String str) => Sys.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Sys.fromJson(Map<String, dynamic> json) => Sys(
        type: json["type"] == null ? 0 : json["type"].toInt(),
        id: json["id"] == null ? 0 : json["id"].toInt(),
        country: json["country"] == null ? "-" : json["country"].toString(),
        sunrise: json["sunrise"] == null ? 0 : json["sunrise"].toInt(),
        sunset: json["sunset"] == null ? 0 : json["sunset"].toInt(),
    );

    Map<String, dynamic> toJson() => {
        "type": type == null ? 0 : type?.toInt(),
        "id": id == null ? 0 : id?.toInt(),
        "country": country == null ? "-" : country.toString(),
        "sunrise": sunrise == null ? 0 : sunrise?.toInt(),
        "sunset": sunset == null ? 0 : sunset?.toInt(),
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

class Wind {
    Wind({
        this.speed,
        this.deg,
    });

    final double? speed;
    final int? deg;

    factory Wind.fromRawJson(String str) => Wind.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: json["speed"] == null ? 0.0 : json["speed"].toDouble(),
        deg: json["deg"] == null ? 0 : json["deg"].toInt(),
    );

    Map<String, dynamic> toJson() => {
        "speed": speed == null ? 0.0 : speed?.toDouble(),
        "deg": deg == null ? 0 : deg?.toInt(),
    };
}