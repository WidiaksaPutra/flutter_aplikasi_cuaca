import 'package:aplikasi_cuaca/componen/constans.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Skeleton extends StatelessWidget {
  final double width, hight;
  final String jenis;
  const Skeleton({ Key? key, required this.width, required this.hight, required this.jenis}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: greyShadow1Color, 
      highlightColor: greyShadow2Color,
      child: Container(
        width: width,
        height: hight,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: blackShadowColor,
          borderRadius:(jenis == "topCard") 
          ? BorderRadius.only(bottomLeft: Radius.circular(60.r), bottomRight: Radius.circular(60.r))
          : BorderRadius.circular(35.r),
        ),
      )
    );
  }
}

