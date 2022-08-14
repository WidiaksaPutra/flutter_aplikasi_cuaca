import 'package:aplikasi_cuaca/model/weather_daily.dart';
import 'package:aplikasi_cuaca/model/weather_hourly.dart';
import 'package:aplikasi_cuaca/model/weather_now.dart';
import 'package:aplikasi_cuaca/service/class_geolocation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:aplikasi_cuaca/page/class/class_size_device.dart';

class BottonNextSpaceBetween1 extends StatefulWidget {
  final Widget page;
  final String leftText, rightText;
  const BottonNextSpaceBetween1({ Key? key, required this.page, required this.leftText, required this.rightText}) : super(key: key);

  @override
  State<BottonNextSpaceBetween1> createState() => _BottonNextSpaceBetween1State();
}

class _BottonNextSpaceBetween1State extends State<BottonNextSpaceBetween1> with Geolocation, sizeDevice{
  @override
  Widget build(BuildContext context) {
    getsizeDevice(context);
    late Future<WeatherHourly> futures1;
    late Future<WeatherNow> futures2;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getWidth(10.w), vertical: getHaight(6.h)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Text(widget.leftText, style: TextStyle(fontSize: 20.sp, color: Colors.white, fontFamily: "OpenSauceSans"),),
        TextButton(
          onPressed: () async {
            // setState(() {
            //   futures1 = getDataWeatherHourly();
            //   futures2 = getDataWeatherNow();
            // });
            Get.to(widget.page);
          },
          child: Row(children: [
            Text(widget.rightText, style: TextStyle(fontSize: 15.sp, color: Colors.grey, fontFamily: "OpenSauceSans")),
            Icon(Icons.arrow_forward_ios_outlined, color: Colors.grey, size: 13.r,)
          ],),
        ),],
      ),
    );
  }
}