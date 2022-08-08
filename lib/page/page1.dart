import 'package:aplikasi_cuaca/page/class/button_next_spaceBetween1.dart';
import 'package:aplikasi_cuaca/componen/constans.dart';
import 'package:aplikasi_cuaca/componen/isi_card_informasi_max.dart';
import 'package:aplikasi_cuaca/componen/skeleton.dart';
import 'package:aplikasi_cuaca/model/weather_hourly.dart';
import 'package:aplikasi_cuaca/model/weather_now.dart';
import 'package:aplikasi_cuaca/page/class/class_bottom_cuaca.dart';
import 'package:aplikasi_cuaca/page/class/class_size_mediaquery.dart';
import 'package:aplikasi_cuaca/page/page2.dart';
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

class _Page1State extends State<Page1> with Geolocation, sizeMediaquery{
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
    getSizeMediaquery(context);
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
            for(int i = 0; i < 5 ; i++){
              jamCuacaList.add(DateTime.fromMillisecondsSinceEpoch(weatherHour!.hourly[i].dt!.toInt() * 1000).toString());
              temperatur.add(weatherHour!.hourly[i].temp!.round().toString());
              icon.add(weatherHour!.hourly[i].weather[0].icon.toString());
            }
            late DateTime dateTimeNow = DateTime.fromMillisecondsSinceEpoch(weatherNow!.dt!.toInt() * 1000);
            jamNow = DateFormat('mm', 'id').format(DateTime.now());
            return RefreshIndicator(
              onRefresh: _refreshPage, 
              child: OrientationDevice(
                portrait: Column(children: [
                  IsiCardInformasiMax(nameLokasi: weatherNow!.name.toString(), icon: weatherNow!.weather[0].icon.toString(), mainCuaca: weatherNow!.weather[0].main.toString(),
                    temperatur: weatherNow!.main!.temp!.round().toString(), windSpeed: weatherNow!.wind!.speed!.round().toString(),
                    humidity: weatherNow!.main!.humidity!.round().toString(), clouds: weatherNow!.clouds!.all!.round().toString(),
                    dateTime: dateTimeNow.toString(), jamNow: jamNow.toString(),),
                  const BottonNextSpaceBetween1(page: Page2(), leftText: "Today", rightText: "7 days "),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: ContainerBottomCuaca(temperatur: temperatur, icon: icon, jamCuacaList: jamCuacaList, jamCuacaNow: dateTimeNow.toString()),      
                  ),
                ]),
              landscape: Row(children: [
                IsiCardInformasiMax(nameLokasi: weatherNow!.name.toString(), icon: weatherNow!.weather[0].icon.toString(), mainCuaca: weatherNow!.weather[0].main.toString(),
                  temperatur: weatherNow!.main!.temp!.round().toString(), windSpeed: weatherNow!.wind!.speed!.round().toString(),
                  humidity: weatherNow!.main!.humidity!.round().toString(), clouds: weatherNow!.clouds!.all!.round().toString(),
                  dateTime: dateTimeNow.toString(), jamNow: jamNow.toString(),),
                Column(children: [
                  const BottonNextSpaceBetween1(page: Page2(), leftText: "Today", rightText: "7 days "),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: ContainerBottomCuaca(temperatur: temperatur, icon: icon, jamCuacaList: jamCuacaList, jamCuacaNow: dateTimeNow.toString()),      
                    ),
                  ),
                ],) 
              ]),),
            );
          }else{
            return Column(
              children: [
                Skeleton(width: sizeMediaquery.sizeWidth.w, hight: (sizeMediaquery.sizeHeight - getHaight(230)).h, jenis: "topCard"),
                SizedBox(height: getHaight(15).h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Skeleton(hight: getHaight(30).h, width: getWidth(80).w, jenis: "centerCard"),
                    Skeleton(hight: getHaight(30).h, width: getWidth(80).w, jenis: "centerCard"),
                  ]
                ),
                SizedBox(height: getHaight(30).h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for(int a = 0 ; a < 4 ; a ++)...[
                      Skeleton(width: getWidth(80).w, hight: getHaight(120).h, jenis: "bottomCard"),
                    ]
                  ],
                )
              ],
            ); 
          } 
        }),
      ),
    );
  }
}