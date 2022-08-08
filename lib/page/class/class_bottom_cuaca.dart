import 'package:aplikasi_cuaca/componen/container_bottom_cuaca.dart';
import 'package:aplikasi_cuaca/page/class/class_size_mediaquery.dart';
import 'package:aplikasi_cuaca/page/class/class_responive.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerBottomCuaca extends StatefulWidget {
  final List<String> temperatur, icon, jamCuacaList;
  final String jamCuacaNow;
  const ContainerBottomCuaca({ Key? key, required this.temperatur, required this.icon,
  required this.jamCuacaList, required this.jamCuacaNow}) : super(key: key);

  @override
  State<ContainerBottomCuaca> createState() => _ContainerBottomCuaca();
}

class _ContainerBottomCuaca extends State<ContainerBottomCuaca> with sizeMediaquery{

  @override
  Widget build(BuildContext context) {
    getSizeMediaquery(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getHaight(10).h),
      child: OrientationDevice(
        portrait: Row(
          children: [
            for(int a = 0 ; a < widget.temperatur.length ; a++)...[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getWidth(10).w),
                child: ContinerBottom(
                  light : (DateFormat('HH', 'id').format(DateTime.parse(widget.jamCuacaList[a])).toString() == DateFormat('HH', 'id').format(DateTime.parse(widget.jamCuacaNow)).toString()) ? "light" : "dark",
                  param1: widget.temperatur[a],
                  icon: widget.icon[a],
                  param2: (getHeightVisible() == false) 
                  ? DateFormat('hh', 'id').format(DateTime.parse(widget.jamCuacaList[a])).toString() 
                  : DateFormat('hh:mm', 'id').format(DateTime.parse(widget.jamCuacaList[a])).toString(),
                ),
              ),
            ]
          ],
        ),
        landscape: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for(int a = 0 ; a < widget.temperatur.length ; a ++)...[
              Padding(
                padding: EdgeInsets.symmetric(vertical: getHaight(10).w),
                child: ContinerBottom(
                  light : (DateFormat('HH', 'id').format(DateTime.parse(widget.jamCuacaList[a])).toString() == DateFormat('HH', 'id').format(DateTime.parse(widget.jamCuacaNow)).toString()) ? "light" : "dark",
                  param1: widget.temperatur[a],
                  icon: widget.icon[a],
                  param2: (getWidthVisible() == false) 
                  ? DateFormat('hh', 'id').format(DateTime.parse(widget.jamCuacaList[a])).toString() 
                  : DateFormat('hh:mm', 'id').format(DateTime.parse(widget.jamCuacaList[a])).toString(),
                ),
              ),
            ]
          ],
        ),
      ), 
    );
  }
}