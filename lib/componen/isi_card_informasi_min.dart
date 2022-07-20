import 'package:aplikasi_cuaca/componen/constans.dart';
import 'package:aplikasi_cuaca/componen/container_top_cuaca.dart';
import 'package:aplikasi_cuaca/componen/skeleton.dart';
import 'package:aplikasi_cuaca/service/classGeolocation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IsiCardInformasiMin extends StatefulWidget {
  const IsiCardInformasiMin({ Key? key }) : super(key: key);

  @override
  State<IsiCardInformasiMin> createState() => _IsiCardInformasiMinState();
}

class _IsiCardInformasiMinState extends State<IsiCardInformasiMin> with Geolocation {
  
  @override
  Widget build(BuildContext context) {
    setState(() {
      getDataWeatherDaily();
    });
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width.w,
      height: (size.width.h - 50.h),
      child: FutureBuilder(
        future: getDataWeatherDaily(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.calendar_today, color: Colors.white),
                  Text(" 7 Days", style: TextStyle(fontSize: 20.sp, color: whiteColor, fontWeight: FontWeight.bold)),
              ],),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                Image.network('http://openweathermap.org/img/wn/${weatherDaily!.daily[1].weather[0].icon}@2x.png'),
                Column(children: [
                  Text("Tomorrow", style: TextStyle(fontSize: 18.sp, color: whiteColor, fontWeight: FontWeight.bold)),
                  Text("${weatherDaily!.daily[1].temp!.day!.round().toString()}°", style: TextStyle(fontSize: 40.sp, color: whiteColor, fontWeight: FontWeight.bold)),
                  Text(weatherDaily!.daily[1].weather[0].description.toString(), style: TextStyle(fontSize: 18.sp, color: whiteShadowColor, fontWeight: FontWeight.bold)),
                ],)
              ],),
              ContainerTopCuaca(iconCuaca1: weatherDaily!.daily[1].weather[0].icon.toString(), iconCuaca2: weatherDaily!.daily[1].weather[0].icon.toString(), iconCuaca3: weatherDaily!.daily[1].weather[0].icon.toString(), speed: weatherDaily!.daily[1].windSpeed!.round().toString(), humidity: weatherDaily!.daily[1].humidity!.round().toString(), clouds: weatherDaily!.daily[1].rain!.round().toString()),
              ],
            );
          }else{
            return Skeleton(width: size.width.w, hight: (size.width.h - 50.h), jenis: "topCard");
          }

        }
      ),
    );
  }
}