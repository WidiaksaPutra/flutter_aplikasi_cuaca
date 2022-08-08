import 'package:aplikasi_cuaca/componen/card_informasi_cuaca.dart';
import 'package:aplikasi_cuaca/componen/constans.dart';
import 'package:aplikasi_cuaca/componen/container_top_cuaca.dart';
import 'package:aplikasi_cuaca/page/class/class_size_mediaquery.dart';
import 'package:aplikasi_cuaca/page/class/class_responive.dart';
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

class _IsiCardInformasiMinState extends State<IsiCardInformasiMin> with sizeMediaquery{
  
  @override
  Widget build(BuildContext context) {
    getSizeMediaquery(context);
    return OrientationDevice(
      portrait: CardInformasiCuaca(
        child: SizedBox(
          width: sizeMediaquery.sizeWidth.w,
          height: (sizeMediaquery.sizeHeight - getHaight(400)).h,
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
              (getWidthVisible() == false || getHeightVisible() == false) ? const Text("") : Image.network('http://openweathermap.org/img/wn/${widget.icon}@2x.png'),
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
      ),
      landscape: CardInformasiCuaca(
        child: SizedBox(
          width:(sizeMediaquery.sizeWidth - getWidth(400)).w,
          height: sizeMediaquery.sizeHeight.h,
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
              (getWidthVisible() == false) ? const Text("") : Image.network('http://openweathermap.org/img/wn/${widget.icon}@2x.png'),
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
      ),
    );
  }
}