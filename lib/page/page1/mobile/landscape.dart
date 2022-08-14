import 'package:aplikasi_cuaca/componen/isi_card_informasi_max/isi_card_informasi_max.dart';
import 'package:aplikasi_cuaca/page/class/button_next_spaceBetween1.dart';
import 'package:aplikasi_cuaca/page/class/class_bottom_cuaca/class_bottom_cuaca.dart';
import 'package:flutter/material.dart';

class LandscapePage1 extends StatelessWidget {
  String name, icon, main, 
  temp, speed, humidity, 
  clouds, dateTimeNow, jamNow, 
  dateTimeNow2;
  List<String> temperatur, iconArr, jamCuacaList;
  Widget page;
  LandscapePage1({ Key? key, required this.name, required this.icon, required this.main, 
  required this.temp, required this.speed, required this.humidity, 
  required this.clouds, required this.dateTimeNow, required this.jamNow,
  required this.temperatur, required this.iconArr, required this.jamCuacaList,
  required this.dateTimeNow2, required this.page }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      IsiCardInformasiMax(nameLokasi: name, icon: icon, mainCuaca: main,
        temperatur: temp, windSpeed: speed,
        humidity: humidity, clouds: clouds,
        dateTime: dateTimeNow, jamNow: jamNow,),
      Column(children: [
        BottonNextSpaceBetween1(page: page, leftText: "Today", rightText: "7 days "),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: ContainerBottomCuaca(temperatur: temperatur, icon: iconArr, jamCuacaList: jamCuacaList, jamCuacaNow: dateTimeNow2),      
          ),
        ),
      ],) 
    ]);
  }
}