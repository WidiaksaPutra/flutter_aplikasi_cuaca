import 'package:aplikasi_cuaca/componen/skeleton.dart';
import 'package:aplikasi_cuaca/page/class/class_size_device.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

class Page2SkeletonPortrait extends StatelessWidget with sizeDevice{
  const Page2SkeletonPortrait({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return Column(children: [
    Skeleton(width: sizeDevice.sizeWidth.w, hight: (sizeDevice.sizeHeight - getHaight(400)).h, jenis: "topCard"),
    SizedBox(height: getHaight(15).h),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Skeleton(hight: getHaight(30).h, width: getWidth(80).w, jenis: "centerCard"),
          Skeleton(hight: getHaight(30).h, width: getWidth(80).w, jenis: "centerCard"),
        ]
      ),
      Expanded(
        child: ListView.builder(
          itemCount: 7,
          itemBuilder: (context, index){
            return Padding(
              padding: EdgeInsets.symmetric(vertical: getHaight(10).h),
              child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Skeleton(width: (sizeDevice.sizeWidth-10).w, hight: getHaight(60).h, jenis: "bottomCard"),
              ],),
            );
          }
        ),
      ),
    ],);
  }
}