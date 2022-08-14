import 'package:aplikasi_cuaca/componen/container_bottom_cuaca/container_bottom_cuaca.dart';
import 'package:aplikasi_cuaca/page/class/class_size_device.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:intl/intl.dart';

class ContainerBottomCuacaPortrait extends StatelessWidget with sizeDevice{
  final List<String> temperatur, icon, jamCuacaList;
  final String jamCuacaNow;
  const ContainerBottomCuacaPortrait({ Key? key, required this.temperatur, required this.icon,
  required this.jamCuacaList, required this.jamCuacaNow }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for(int a = 0 ; a < temperatur.length ; a++)...[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getWidth(10).w),
            child: ContinerBottom(
              light : (DateFormat('HH', 'id').format(DateTime.parse(jamCuacaList[a])).toString() == DateFormat('HH', 'id').format(DateTime.parse(jamCuacaNow)).toString()) ? "light" : "dark",
              param1: temperatur[a],
              icon: icon[a],
              param2: (getHeightVisiblePortrait() == false) 
              ? DateFormat('hh', 'id').format(DateTime.parse( jamCuacaList[a])).toString() 
              : DateFormat('hh:mm', 'id').format(DateTime.parse( jamCuacaList[a])).toString(),
            ),
          ),
        ]
      ],
    );
  }
}