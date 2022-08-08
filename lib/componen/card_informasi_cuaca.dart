import 'package:aplikasi_cuaca/componen/constans.dart';
import 'package:aplikasi_cuaca/page/class/class_size_mediaquery.dart';
import 'package:aplikasi_cuaca/page/class/class_responive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardInformasiCuaca extends StatelessWidget with sizeMediaquery{
  final Widget child;

  const CardInformasiCuaca({ Key? key, 
  required this.child});

  @override
  Widget build(BuildContext context) {
    getSizeMediaquery(context);
    return OrientationDevice(
      portrait: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: blueColorShadow3,
              spreadRadius: -20.r,
              offset: Offset(getWidth(0).w, getHaight(70).h),
              blurRadius: 50.0.r,
            ),
            BoxShadow(
              color: blueColorShadow2,
              spreadRadius: -4.r,
              offset: Offset(getWidth(0).w, getHaight(15).h),
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
        child: child,
      ),
      landscape: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: blueColorShadow3,
              spreadRadius: -20.r,
              offset: Offset(getWidth(70).w, getHaight(0).h),
              blurRadius: 50.0.r,
            ),
            BoxShadow(
              color: blueColorShadow2,
              spreadRadius: -4.r,
              offset: Offset(getWidth(15).w, getHaight(0).h),
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
            begin: Alignment.centerLeft,
            end: Alignment.centerRight
          ),
          borderRadius: BorderRadius.only(topRight: Radius.circular(60.r), bottomRight: Radius.circular(60.r)),
        ),
        child: child,
      ), 
    );
  }
}