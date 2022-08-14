import 'package:aplikasi_cuaca/componen/constans.dart';
import 'package:aplikasi_cuaca/page/class/class_size_device.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

class CardInformasiCuacaPortrait extends StatelessWidget with sizeDevice{
  final Widget child;
  const CardInformasiCuacaPortrait({ Key? key, required this.child }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}