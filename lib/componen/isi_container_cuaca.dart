import 'package:aplikasi_cuaca/componen/constans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IsiContainerTopBottom extends StatelessWidget {
  final String validasi, icon, param1, param2;
  const IsiContainerTopBottom({ Key? key, required this.validasi, required this.icon, required this.param1, required this.param2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (validasi == "bottom") 
      ? Container(
        height: 140.h,
        width: 80.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35.r),
            border: Border.all(color: whiteShadowColor, width: 1.w),
            boxShadow: [ 
              BoxShadow(
                color: blackColor,
                blurRadius: 2.0.r,
                spreadRadius: 0.1.r,
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.0.w, vertical: 17.0.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("$param1°", textAlign: TextAlign.center, style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold, color: whiteColor),),
                Image.network('http://openweathermap.org/img/wn/$icon.png'),
                Text(param2, textAlign: TextAlign.center, style: TextStyle(fontSize: 13.sp, color: whiteShadowColor)),
              ],  
            ),
          ),
        )
      : Expanded(
        flex: 3,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: SizedBox(
            height: 150.h,
            child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.0.w, vertical: 25.0.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.network('http://openweathermap.org/img/wn/$icon.png'),
                  Text(param1, textAlign: TextAlign.center, style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold, color: whiteColor),),
                  Text(param2, textAlign: TextAlign.center, style: TextStyle(fontSize: 13.sp, color: whiteShadowColor)),
                ],  
              ),
            ),
          ),
        ),
      );
  }
}