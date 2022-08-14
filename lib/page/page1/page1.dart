import 'package:aplikasi_cuaca/componen/constans.dart';
import 'package:aplikasi_cuaca/model/weather_hourly.dart';
import 'package:aplikasi_cuaca/model/weather_now.dart';
import 'package:aplikasi_cuaca/page/class/class_size_device.dart';
import 'package:aplikasi_cuaca/page/page1/mobile/landscape.dart';
import 'package:aplikasi_cuaca/page/page1/mobile/portrait.dart';
import 'package:aplikasi_cuaca/page/page1/skeleton/landscape.dart';
import 'package:aplikasi_cuaca/page/page1/skeleton/portrait.dart';
import 'package:aplikasi_cuaca/page/page2/page2.dart';
import 'package:aplikasi_cuaca/service/class_geolocation.dart';
import 'package:aplikasi_cuaca/page/class/class_responive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class Page1 extends StatefulWidget {
  const Page1({ Key? key }) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> with Geolocation, sizeDevice{
  late Future<WeatherHourly> futures1 = getDataWeatherHourly();
  late Future<WeatherNow> futures2 = getDataWeatherNow(); 
  late String jamNow;

  Future _refreshPage() async{
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      futures1 = getDataWeatherHourly();
      futures2 = getDataWeatherNow();
      jamNow = DateFormat('mm', 'id').format(DateTime.now());
    }); 
  }

  @override
  void initState() {
    initializeDateFormatting();
    super.initState();
  }

  Future<dynamic> fetchData() async {
    var responses = await Future.wait([
      futures1,futures2
    ]);
    return "${responses[0]}, ${responses[1]}";
  }

  @override
  Widget build(BuildContext context) {
    getsizeDevice(context);
    return Scaffold(
      body: Container(
        color: blackColor,
        child: FutureBuilder(
        future: fetchData(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            late List<String> jamCuacaList = [];
            late List<String> temperatur = [];
            late List<String> icon = [];
            for(int i = 0; i < 10 ; i++){
              jamCuacaList.add(DateTime.fromMillisecondsSinceEpoch(weatherHour!.hourly[i].dt!.toInt() * 1000).toString());
              temperatur.add(weatherHour!.hourly[i].temp!.round().toString());
              icon.add(weatherHour!.hourly[i].weather[0].icon.toString());
            }
            late DateTime dateTimeNow = DateTime.fromMillisecondsSinceEpoch(weatherNow!.dt!.toInt() * 1000);
            jamNow = DateFormat('mm', 'id').format(DateTime.now());
            return RefreshIndicator(
              onRefresh: _refreshPage, 
              child:
              //  ResponsiveDevice(
              //   mobile: 
                OrientationDevice(
                  portrait: PortraitPage1(name: weatherNow!.name.toString(), icon: weatherNow!.weather[0].icon.toString(), main: weatherNow!.weather[0].main.toString(),
                    temp: weatherNow!.main!.temp!.round().toString(), speed:weatherNow!.wind!.speed!.round().toString(), humidity: weatherNow!.main!.humidity!.round().toString(),
                    clouds: weatherNow!.clouds!.all!.round().toString(), dateTimeNow: dateTimeNow.toString(), jamNow: jamNow.toString(), 
                    temperatur: temperatur, iconArr: icon, jamCuacaList: jamCuacaList, dateTimeNow2: dateTimeNow.toString(), page: Page2()),
                  landscape: LandscapePage1(name: weatherNow!.name.toString(), icon: weatherNow!.weather[0].icon.toString(), main: weatherNow!.weather[0].main.toString(),
                    temp: weatherNow!.main!.temp!.round().toString(), speed:weatherNow!.wind!.speed!.round().toString(), humidity: weatherNow!.main!.humidity!.round().toString(),
                    clouds: weatherNow!.clouds!.all!.round().toString(), dateTimeNow: dateTimeNow.toString(), jamNow: jamNow.toString(), 
                    temperatur: temperatur, iconArr: icon, jamCuacaList: jamCuacaList, dateTimeNow2: dateTimeNow.toString(), page: Page2()),
                ),
              //   tablet: PortraitPage1(name: weatherNow!.name.toString(), icon: weatherNow!.weather[0].icon.toString(), main: weatherNow!.weather[0].main.toString(),
              //     temp: weatherNow!.main!.temp!.round().toString(), speed:weatherNow!.wind!.speed!.round().toString(), humidity: weatherNow!.main!.humidity!.round().toString(),
              //     clouds: weatherNow!.clouds!.all!.round().toString(), dateTimeNow: dateTimeNow.toString(), jamNow: jamNow.toString(), 
              //     temperatur: temperatur, iconArr: icon, jamCuacaList: jamCuacaList, dateTimeNow2: dateTimeNow.toString(), page: Page2()),
              // ),
            );
          }else{
            return 
            // const ResponsiveDevice(
            //   mobile: 
              const OrientationDevice(
                portrait: Page1SkeletonPortrait(),
                landscape: Page1SkeletonLandscape(),
              );
            //   tablet: Page1SkeletonPortrait(),
            // );   
          } 
        }),
      ),
    );
  }
}