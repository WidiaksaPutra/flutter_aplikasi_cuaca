import 'package:aplikasi_cuaca/componen/constans.dart';
import 'package:aplikasi_cuaca/page/class/class_responive.dart';
import 'package:aplikasi_cuaca/page/class/class_size_device.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Skeleton extends StatelessWidget with sizeDevice{
  final double width, hight;
  final String jenis;
  const Skeleton({ Key? key, required this.width, required this.hight, required this.jenis}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getsizeDevice(context);
    return Shimmer.fromColors(
      baseColor: greyShadow1Color, 
      highlightColor: greyShadow2Color,
      child: OrientationDevice(
        portrait: Container(
          width: width,
          height: hight,
          padding: EdgeInsets.symmetric(vertical: getHaight(20).h, horizontal: getWidth(20).w),
          decoration: BoxDecoration(
            color: blackShadowColor,
            borderRadius:(jenis == "topCard") 
            ? BorderRadius.only(bottomLeft: Radius.circular(60.r), bottomRight: Radius.circular(60.r))
            : BorderRadius.circular(35.r),
          ),
        ),
        landscape: Container(
          width: width,
          height: hight,
          padding: EdgeInsets.symmetric(vertical: getHaight(20).h, horizontal: getWidth(20).w),
          decoration: BoxDecoration(
            color: blackShadowColor,
            borderRadius:(jenis == "topCard") 
            ? BorderRadius.only(topRight: Radius.circular(60.r), bottomRight: Radius.circular(60.r))
            : BorderRadius.circular(35.r),
          ),
        ),
      ),      
    );
  }
}

