import 'package:aplikasi_cuaca/componen/card_informasi_cuaca/card_informasi_cuaca.dart';
import 'package:aplikasi_cuaca/componen/constans.dart';
import 'package:aplikasi_cuaca/componen/Isi_continer_top/container_top_cuaca.dart';
import 'package:aplikasi_cuaca/componen/isi_card_informasi_min/mobile/lanscape.dart';
import 'package:aplikasi_cuaca/componen/isi_card_informasi_min/mobile/portrait.dart';
import 'package:aplikasi_cuaca/page/class/class_size_device.dart';
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

class _IsiCardInformasiMinState extends State<IsiCardInformasiMin> with sizeDevice{
  
  @override
  Widget build(BuildContext context) {
    getsizeDevice(context);
    return OrientationDevice(
      portrait: IsiCardInformasiMinPortrait(icon: widget.icon ,description: widget.description 
        ,day: widget.day ,windSpeed: widget.windSpeed ,rain: widget.rain ,humidity: widget.humidity,
        feelsLike: widget.feelsLike),
      landscape: IsiCardInformasiMinLanscape(icon: widget.icon ,description: widget.description 
        ,day: widget.day ,windSpeed: widget.windSpeed ,rain: widget.rain ,humidity: widget.humidity,
        feelsLike: widget.feelsLike),
    );
  }
}