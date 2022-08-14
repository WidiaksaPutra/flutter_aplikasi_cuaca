import 'package:aplikasi_cuaca/componen/Isi_continer_top/container_top_cuaca.dart';
import 'package:aplikasi_cuaca/componen/card_informasi_cuaca/card_informasi_cuaca.dart';
import 'package:aplikasi_cuaca/componen/constans.dart';
import 'package:aplikasi_cuaca/page/class/class_size_device.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

class IsiCardInformasiMinPortrait extends StatelessWidget with sizeDevice{
  final String icon, description, day, windSpeed, rain, humidity, feelsLike;
  const IsiCardInformasiMinPortrait({ Key? key, required this.icon, required this.description, 
    required this.day, required this.windSpeed, required this.rain,
    required this.humidity, required this.feelsLike }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardInformasiCuaca(
      child: SizedBox(
        width: sizeDevice.sizeWidth.w,
        height: (sizeDevice.sizeHeight - getHaight(400)).h,
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
            (getWidthVisiblePortrait() == false || getHeightVisiblePortrait() == false) ? const Text("") : Image.network('http://openweathermap.org/img/wn/$icon@2x.png'),
            Column(children: [ 
              Text("Tomorrow", style: TextStyle(fontSize: 18.sp, color: whiteColor, fontWeight: FontWeight.bold, fontFamily: "OpenSauceSans")),
              Row(children: [
                  Text(day, style: TextStyle(fontSize: 50.sp, color: whiteColor, fontWeight: FontWeight.bold, fontFamily: "OpenSauceSans")),
                  Text("/$feelsLike°", style: TextStyle(fontSize: 30.sp, color: whiteShadowColor, fontWeight: FontWeight.bold, fontFamily: "OpenSauceSans"))
                ],
              ),
              Text(description, style: TextStyle(fontSize: 18.sp, color: whiteShadowColor, fontWeight: FontWeight.bold, fontFamily: "OpenSauceSans")),
            ],)
          ],),
          ContainerTopCuaca(icon: icon, speed: windSpeed, humidity: humidity, clouds: rain),
          ],
        ),
      ),
    );
  }
}