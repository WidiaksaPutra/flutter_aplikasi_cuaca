import 'package:aplikasi_cuaca/componen/constans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContinerBottom extends StatelessWidget {
  final String param1, icon, param2, light;
  const ContinerBottom({Key? key,required this.param1, required this.icon, required this.param2, required this.light}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (light == "dark")
    ? Container(
        height: 120.h,
        width: 80.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35.r),
          border: Border.all(color: whiteShadowColor, width: 1.w),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 17.0.w, vertical: 17.0.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("$param1°", textAlign: TextAlign.center, style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold, color: whiteColor, fontFamily: "OpenSauceSans"),),
              Image.network('http://openweathermap.org/img/wn/$icon.png'),
              Text(param2, textAlign: TextAlign.center, style: TextStyle(fontSize: 12.sp, fontFamily: "OpenSauceSans", color: whiteShadowColor)),
            ],  
          ),
        ),
      )
    : Container(
        height: 120.h,
        width: 80.w,
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
              offset: Offset(0.r, 5.r),
              blurRadius: 10.0.r,
            ),
            BoxShadow(
              color: blueColorShadow1,
              spreadRadius: 1.5.r,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 17.0.w, vertical: 17.0.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("$param1°", textAlign: TextAlign.center, style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold, color: whiteColor, fontFamily: "OpenSauceSans"),),
              Image.network('http://openweathermap.org/img/wn/$icon.png'),
              Text(param2, textAlign: TextAlign.center, style: TextStyle(fontSize: 12.sp, color: whiteColor, fontFamily: "OpenSauceSans")),
            ],  
          ),
        ),
      );
  }
}