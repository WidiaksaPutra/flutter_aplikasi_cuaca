import 'package:aplikasi_cuaca/componen/skeleton.dart';
import 'package:aplikasi_cuaca/page/class/class_size_device.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

class Page2SkeletonLandscape extends StatelessWidget with sizeDevice{
  const Page2SkeletonLandscape({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Skeleton(width: (sizeDevice.sizeWidth - getWidth(400)).w, hight: sizeDevice.sizeHeight.h, jenis: "topCard"),
        Column(children: [
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
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  for(int a = 0 ; a < 7 ; a ++)...[
                    Skeleton(width: (sizeDevice.sizeWidth-400).w, hight: getHaight(40).h, jenis: "bottomCard"),
                    SizedBox(height: getHaight(10).h),
                  ],
                ],
              ),
            ),
          ),
        ]),
      ],
    );
  }
}