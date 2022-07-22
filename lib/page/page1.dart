import 'package:aplikasi_cuaca/componen/card_informasi_cuaca.dart';
import 'package:aplikasi_cuaca/componen/constans.dart';
import 'package:aplikasi_cuaca/componen/container_bottom_cuaca.dart';
import 'package:aplikasi_cuaca/componen/skeleton.dart';
import 'package:aplikasi_cuaca/page/page2.dart';
import 'package:aplikasi_cuaca/service/classGeolocation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';

class Page1 extends StatefulWidget {
  const Page1({ Key? key }) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> with Geolocation{
  
  @override
  void initState() {
    initializeDateFormatting();
    super.initState();
  }

  Future<dynamic> fetchData() async {
    var responses = await Future.wait([
      getDataWeatherNow(),
      getDataWeatherHourly(),
    ]);
    return "${responses[0]}, ${responses[1]}";
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
            for(int i = 0; i < 4 ; i++){
              jamCuacaList.add(DateTime.fromMillisecondsSinceEpoch(weatherHour!.hourly[i].dt!.toInt() * 1000).toString());
              temperatur.add(weatherHour!.hourly[i].temp!.round().toString());
              icon.add(weatherHour!.hourly[i].weather[0].icon.toString());
            }
            late DateTime dateTimeNow = DateTime.fromMillisecondsSinceEpoch(weatherNow!.dt!.toInt() * 1000);
            return  
              Column(children: [
                CardInformasiCuacaMax(
                  StringUkuranCard: "max", 
                  nameLokasi: weatherNow!.name.toString(), icon: weatherNow!.weather[0].icon.toString(), mainCuaca: weatherNow!.weather[0].main.toString(),
                  temperatur: weatherNow!.main!.temp!.round().toString(), windSpeed: weatherNow!.wind!.speed!.round().toString(),
                  humidity: weatherNow!.main!.humidity!.round().toString(), clouds: weatherNow!.clouds!.all!.round().toString(),
                  dateTime: dateTimeNow.toString()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text("Today", style: TextStyle(fontSize: 20.sp, color: Colors.white),),
                  TextButton(
                    onPressed: () async {
                      Get.to(const Page2());
                    },
                    child: Row(children: [
                      Text("7 days ", style: TextStyle(fontSize: 15.sp, color: Colors.grey)),
                      Icon(Icons.arrow_forward_ios_outlined, color: Colors.grey, size: 13.r,)
                    ],),
                  ),
              ],),
              ContainerBottomCuaca(temperatur: temperatur, icon: icon, jamCuacaList: jamCuacaList),
              
              ]);
          }else{
            return Column(
              children: [
                Skeleton(width: size.width.w, hight: (size.height.h - 230.h), jenis: "topCard"),
                SizedBox(height: 10.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: 15.h,width: 15.w),
                    SizedBox(height: 15.h,width: 15.w),
                  ]
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for(int a = 0 ; a < 4 ; a ++)...[
                      Skeleton(width: 80.w, hight: 140.h, jenis: "bottomCard"),
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