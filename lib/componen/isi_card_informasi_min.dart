import 'package:aplikasi_cuaca/componen/card_informasi_cuaca.dart';
import 'package:aplikasi_cuaca/componen/constans.dart';
import 'package:aplikasi_cuaca/componen/container_top_cuaca.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IsiCardInformasiMin extends StatefulWidget {
  final String icon, description, day, windSpeed, rain, humidity, feelsLike;

  const IsiCardInformasiMin({ Key? key, 
    required this.icon, required this.description, 
    required this.day, required this.windSpeed, required this.rain,
    required this.humidity, required this.feelsLike}) : super(key: key);

  @override
  State<IsiCardInformasiMin> createState() => _IsiCardInformasiMinState();
}

class _IsiCardInformasiMinState extends State<IsiCardInformasiMin> {
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CardInformasiCuaca(
      child: SizedBox(
        width: size.width.w,
        height: (size.width.h - 50.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(Icons.grid_view_rounded, color: Colors.white), 
              Row(
                children: [
                  const Icon(Icons.calendar_today, color: Colors.white),
                  Text(" 7 Days", style: TextStyle(fontSize: 20.sp, color: whiteColor, fontWeight: FontWeight.bold, fontFamily: "OpenSauceSans")),
                ],
              ),
              const Icon(Icons.more_vert, color: Colors.white),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            Image.network('http://openweathermap.org/img/wn/${widget.icon}@2x.png'),
            Column(children: [ 
              Text("Tomorrow", style: TextStyle(fontSize: 18.sp, color: whiteColor, fontWeight: FontWeight.bold, fontFamily: "OpenSauceSans")),
              Row(children: [
                  Text(widget.day, style: TextStyle(fontSize: 50.sp, color: whiteColor, fontWeight: FontWeight.bold, fontFamily: "OpenSauceSans")),
                  Text("/${widget.feelsLike}°", style: TextStyle(fontSize: 30.sp, color: whiteShadowColor, fontWeight: FontWeight.bold, fontFamily: "OpenSauceSans"))
                ],
              ),
              Text(widget.description, style: TextStyle(fontSize: 18.sp, color: whiteShadowColor, fontWeight: FontWeight.bold, fontFamily: "OpenSauceSans")),
            ],)
          ],),
          ContainerTopCuaca(icon: widget.icon, speed: widget.windSpeed, humidity: widget.humidity, clouds: widget.rain),
          ],
        ),
      ),
    );
  }
}