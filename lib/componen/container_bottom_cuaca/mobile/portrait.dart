import 'package:aplikasi_cuaca/componen/constans.dart';
import 'package:aplikasi_cuaca/page/class/class_size_device.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

class ContinerBottomPortrait extends StatelessWidget with sizeDevice{
  final String param1, icon, param2, light;
  const ContinerBottomPortrait({ Key? key, required this.param1, required this.icon, required this.param2, required this.light}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (light == "dark")
    ? Container(
        height: (getHeightVisiblePortrait() == false) ? getHaight(100).h : getHaight(120).h,
        width: getWidth(80).w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35.r),
          border: Border.all(color: whiteShadowColor, width: getWidth(1).w),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getWidth(17.0).w, vertical: getHaight(17.0).h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("$param1°", textAlign: TextAlign.center, style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold, color: whiteColor, fontFamily: "OpenSauceSans"),),
              (getWidthVisiblePortrait() == false || getHeightVisiblePortrait() == false) ? const Text("") : Image.network('http://openweathermap.org/img/wn/$icon.png'),
              Text(param2, textAlign: TextAlign.center, style: TextStyle(fontSize: 12.sp, fontFamily: "OpenSauceSans", color: whiteShadowColor)),
            ],  
          ),
        ),
      )
    : Container(
        height: (getHeightVisiblePortrait() == false) ? getHaight(100).h : getHaight(120).h,
        width: getWidth(80).w,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              blueColor1,
              blueColor2
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          ),
          borderRadius: BorderRadius.circular(35.r),
          boxShadow: [
            BoxShadow(
              color: whiteShadowColor,
              spreadRadius: -1.r,
              offset: Offset(getWidth(0).w, getHaight(5).h),
              blurRadius: 10.0.r,
            ),
            BoxShadow(
              color: blueColorShadow1,
              spreadRadius: 1.5.r,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getWidth(17.0).w, vertical: getHaight(17.0).h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("$param1°", textAlign: TextAlign.center, style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold, color: whiteColor, fontFamily: "OpenSauceSans"),),
              (getWidthVisiblePortrait() == false || getHeightVisiblePortrait() == false) ? const Text("") : Image.network('http://openweathermap.org/img/wn/$icon.png'),
              Text(param2, textAlign: TextAlign.center, style: TextStyle(fontSize: 12.sp, color: whiteColor, fontFamily: "OpenSauceSans")),
            ],  
          ),
        ),
      );
  }
}