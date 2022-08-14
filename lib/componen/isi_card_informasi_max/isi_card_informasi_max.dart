import 'package:aplikasi_cuaca/componen/isi_card_informasi_max/mobile/landscape.dart';
import 'package:aplikasi_cuaca/componen/isi_card_informasi_max/mobile/portrait.dart';
import 'package:aplikasi_cuaca/page/class/class_size_device.dart';
import 'package:aplikasi_cuaca/page/class/class_responive.dart';
import 'package:flutter/material.dart';

class IsiCardInformasiMax extends StatefulWidget {
  final String nameLokasi, icon, mainCuaca, dateTime, temperatur, windSpeed, humidity, clouds, jamNow;
  const IsiCardInformasiMax({ Key? key, 
  required this.nameLokasi, required this.icon, required this.mainCuaca, 
  required this.temperatur, required this.windSpeed, 
  required this.humidity, required this.clouds, 
  required this.dateTime, required this.jamNow}) : super(key: key);

  @override
  State<IsiCardInformasiMax> createState() => _IsiCardInformasiMaxState();
}

class _IsiCardInformasiMaxState extends State<IsiCardInformasiMax> with sizeDevice{
 
  @override
  Widget build(BuildContext context) {
    getsizeDevice(context);
    return OrientationDevice(
      portrait: IsiCardInformasiMaxPortrait(nameLokasi: widget.nameLokasi, icon: widget.icon, 
        mainCuaca: widget.mainCuaca, dateTime: widget.dateTime, temperatur: widget.temperatur, 
        windSpeed: widget.windSpeed, humidity: widget.humidity, clouds: widget.clouds, 
        jamNow: widget.jamNow),
      landscape: IsiCardInformasiMaxLandscape(nameLokasi: widget.nameLokasi, icon: widget.icon, 
        mainCuaca: widget.mainCuaca, dateTime: widget.dateTime, temperatur: widget.temperatur, 
        windSpeed: widget.windSpeed, humidity: widget.humidity, clouds: widget.clouds, 
        jamNow: widget.jamNow),
    );
  }
}
