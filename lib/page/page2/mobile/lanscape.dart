import 'package:aplikasi_cuaca/componen/isi_card_informasi_min/isi_card_informasi_min.dart';
import 'package:aplikasi_cuaca/page/class/button_next_spaceBetween1.dart';
import 'package:flutter/material.dart';

class LanscapePage2 extends StatelessWidget {
  String icon, description, temp,
  windSpeed, rain, humidity, feelsLike;
  Widget page, ListExpen;


  LanscapePage2({ Key? key, required this.icon, required this.description, required this.temp,
  required this.windSpeed, required this.rain, required this.humidity, required this.feelsLike, 
  required this.page, required this.ListExpen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IsiCardInformasiMin(icon: icon, description: description, day: temp, 
          windSpeed: windSpeed, rain: rain, humidity: humidity, feelsLike: feelsLike),
         Expanded(
          child: Column(children: [
            BottonNextSpaceBetween1(page: page, leftText: "Tomorrow", rightText: "7 days "),
            ListExpen,
          ]),
        ),       
      ],
    );
  }
}