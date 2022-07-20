import 'package:aplikasi_cuaca/componen/constans.dart';
import 'package:aplikasi_cuaca/componen/skeleton.dart';
import 'package:aplikasi_cuaca/service/classGeolocation.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListViewCuaca extends StatefulWidget {
  const ListViewCuaca({ Key? key }) : super(key: key);

  @override
  State<ListViewCuaca> createState() => _ListViewCuacaState();
}

class _ListViewCuacaState extends State<ListViewCuaca> with Geolocation{
   
  @override
  void initState() {
    initializeDateFormatting();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: FutureBuilder(
        future: getDataWeatherDaily(),
        builder: (context, snapshot){
        if(snapshot.hasData){
          late List<DateTime> dateTimeDaily = []; 
          late List<String> iconDaily = []; 
          late List<String> mainDaily = [];
          late List<double> tempDayDaily = [];
          
          for(int i = 1; i < weatherDaily!.daily.length; i++){
            dateTimeDaily.add(DateTime.fromMillisecondsSinceEpoch(weatherDaily!.daily[i].dt!.toInt() * 1000));
            iconDaily.add(weatherDaily!.daily[i].weather[0].icon.toString());
            mainDaily.add(weatherDaily!.daily[i].weather[0].main.toString()); 
            tempDayDaily.add(weatherDaily!.daily[i].temp!.day!.toDouble());
          }
          return ListView.builder(
          itemCount: weatherDaily!.daily.length-1,
          itemBuilder: (context, index){
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(DateFormat('EEEE', 'id').format(DateTime.parse(dateTimeDaily[index].toString())), style: TextStyle(fontSize: 20.sp, color: whiteShadowColor)),
                Row(
                  children: [
                    Image.network('http://openweathermap.org/img/wn/${iconDaily[index].toString()}.png'),
                    Text(mainDaily[index].toString(), style: TextStyle(fontSize: 20.sp, color: whiteShadowColor)),
                  ],
                ),
                Text("${tempDayDaily[index].round().toString()}°", style: TextStyle(fontSize: 20.sp, color: whiteShadowColor)),
              ],),
            );
          });
        }else{
          return ListView.builder(
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
          });
        }
      }),
    );
  }
}