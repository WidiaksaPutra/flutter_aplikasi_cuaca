import 'package:aplikasi_cuaca/componen/card_informasi_cuaca.dart';
import 'package:aplikasi_cuaca/componen/constans.dart';
import 'package:aplikasi_cuaca/componen/list_view_cuaca.dart';
import 'package:aplikasi_cuaca/componen/skeleton.dart';
import 'package:aplikasi_cuaca/model/weather_daily.dart';
import 'package:aplikasi_cuaca/service/classGeolocation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';

class Page2 extends StatefulWidget {
  const Page2({ Key? key }) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> with Geolocation{
  late Future<WeatherDaily> futures = getDataWeatherDaily();  
  final ScrollController scrollController = ScrollController();
  bool loading = false;


  @override
  void initState(){
    initializeDateFormatting();
    scrollController.addListener(()async { 
      if(scrollController.position.pixels == scrollController.position.maxScrollExtent && !loading){
        setState(() {
          loading = true;
        });
        await Future.delayed(const Duration(milliseconds: 500 ));
        setState(() {
          futures;
        });
        setState(() {
          loading = false;
        });
      }

    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: blackColor,
        child: FutureBuilder(
        future: futures,
        builder: (context, snapshot){
          if(snapshot.hasData){
            late List<String> dateTimeDaily = []; 
            late List<String> iconDaily = []; 
            late List<String> mainDaily = [];
            late List<String> tempDayDaily = [];
            
            for(int i = 1; i < weatherDaily!.daily.length; i++){
              dateTimeDaily.add(DateTime.fromMillisecondsSinceEpoch(weatherDaily!.daily[i].dt!.toInt() * 1000).toString());
              iconDaily.add(weatherDaily!.daily[i].weather[0].icon.toString());
              mainDaily.add(weatherDaily!.daily[i].weather[0].main.toString()); 
              tempDayDaily.add(weatherDaily!.daily[i].temp!.day!.round().toString());
            }
            return Column(
              children: [
                CardInformasiCuacaMax(StringUkuranCard: "min", icon: weatherDaily!.daily[1].weather[0].icon.toString(), 
                description: weatherDaily!.daily[1].weather[0].description.toString(), day: weatherDaily!.daily[1].temp!.day!.round().toString(), 
                windSpeed: weatherDaily!.daily[1].windSpeed!.round().toString(), rain: weatherDaily!.daily[1].rain!.round().toString(), 
                humidity: weatherDaily!.daily[1].humidity!.round().toString()),
                ListViewCuaca(hari: dateTimeDaily, icon: iconDaily, mainCuaca: mainDaily, temperatur: tempDayDaily, dataLength: weatherDaily!.daily.length-1, scrollController: scrollController),
                if(loading)...[
                  Positioned(
                    child: SizedBox(
                      height: 80.h,
                      width: 80.w,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                ],
              ],
            );
          }else{
            return Column(children: [
               Skeleton(width: size.width.w, hight: (size.width.h - 50.h), jenis: "topCard"),
               Expanded(
                child: ListView.builder(
                  itemCount: 7,
                  itemBuilder: (context, index){
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Skeleton(width: (size.width-10.w), hight: 60.h, jenis: "bottomCard"),
                      ],),
                    );
                  }
                ),
              ),
            ],);
          }
        },),
      ),
    );
  }
}