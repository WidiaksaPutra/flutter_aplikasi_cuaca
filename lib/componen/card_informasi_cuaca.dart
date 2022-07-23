import 'package:aplikasi_cuaca/componen/constans.dart';
import 'package:aplikasi_cuaca/componen/isi_card_informasi_max.dart';
import 'package:aplikasi_cuaca/componen/isi_card_informasi_min.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardInformasiCuacaMax extends StatelessWidget {
  final String StringUkuranCard,nameLokasi, icon, mainCuaca, description, dateTime, temperatur, windSpeed, day, rain, humidity, clouds;

  CardInformasiCuacaMax({ Key? key, 
  required this.StringUkuranCard,
  this.nameLokasi = "-", this.icon = "-", this.mainCuaca = "-", this.description = "-",
  this.temperatur = "0.0", this.windSpeed = "0.0", this.day = "0.0", this.rain = "0.0",
  this.humidity = "0", this.clouds = "0",
  this.dateTime = "-"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: blueColorShadow3,
            spreadRadius: -20.r,
            offset: Offset(0.r, 70.r),
            blurRadius: 50.0.r,
          ),
          BoxShadow(
            color: blueColorShadow2,
            spreadRadius: -4.r,
            offset: Offset(0.r, 15.r),
            blurRadius: 3.0.r,
          ),
          BoxShadow(
            color: blueColorShadow1,
            spreadRadius: 1.5.r,
          ),
        ],
        gradient: const LinearGradient(
          colors: [
            blueColor1,
            blueColor2
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter
        ),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60.r), bottomRight: Radius.circular(60.r)),
      ),
      child: (StringUkuranCard == "max") 
      ? IsiCardInformasiMax(nameLokasi: nameLokasi, icon: icon, mainCuaca: mainCuaca, temperatur: temperatur, windSpeed: windSpeed, humidity: humidity, clouds: clouds, dateTime: dateTime)
      : IsiCardInformasiMin(icon: icon, description: description, day: day, windSpeed: windSpeed, rain: rain, humidity: humidity)
    );
  }
}