import 'package:aplikasi_cuaca/componen/constans.dart';
import 'package:aplikasi_cuaca/componen/container_top_cuaca.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IsiCardInformasiMin extends StatefulWidget {
  final String icon, description, day, windSpeed, rain, humidity;

  const IsiCardInformasiMin({ Key? key, 
    required this.icon, required this.description, 
    required this.day, required this.windSpeed, required this.rain,
    required this.humidity}) : super(key: key);

  @override
  State<IsiCardInformasiMin> createState() => _IsiCardInformasiMinState();
}

class _IsiCardInformasiMinState extends State<IsiCardInformasiMin> {
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width.w,
      height: (size.width.h - 50.h),
      child: Column(
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
          Image.network('http://openweathermap.org/img/wn/${widget.icon}@2x.png'),
          Column(children: [
            Text("Tomorrow", style: TextStyle(fontSize: 18.sp, color: whiteColor, fontWeight: FontWeight.bold)),
            Text("${widget.day}°", style: TextStyle(fontSize: 40.sp, color: whiteColor, fontWeight: FontWeight.bold)),
            Text(widget.description, style: TextStyle(fontSize: 18.sp, color: whiteShadowColor, fontWeight: FontWeight.bold)),
          ],)
        ],),
        ContainerTopCuaca(icon: widget.icon, speed: widget.windSpeed, humidity: widget.humidity, clouds: widget.rain),
        ],
      ),
    );
  }
}