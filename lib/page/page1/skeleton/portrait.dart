import 'package:aplikasi_cuaca/componen/skeleton.dart';
import 'package:aplikasi_cuaca/page/class/class_size_device.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

class Page1SkeletonPortrait extends StatelessWidget with sizeDevice{
  const Page1SkeletonPortrait({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Skeleton(width: sizeDevice.sizeWidth.w, hight: (sizeDevice.sizeHeight - getHaight(230)).h, jenis: "topCard"),
        SizedBox(height: getHaight(15).h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Skeleton(hight: getHaight(30).h, width: getWidth(80).w, jenis: "centerCard"),
            Skeleton(hight: getHaight(30).h, width: getWidth(80).w, jenis: "centerCard"),
          ]
        ),
        SizedBox(height: getHaight(30).h),
        Expanded(
          child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              children: [
                for(int a = 0 ; a < 10 ; a ++)...[
                  Skeleton(width: getWidth(80).w, hight: getHaight(120).h, jenis: "bottomCard"),
                  SizedBox(width: getWidth(15).h),
                ]
              ],
            ),
          ),
        ),
      ],
    );
  }
}