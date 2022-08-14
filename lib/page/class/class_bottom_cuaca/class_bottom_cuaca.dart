import 'package:aplikasi_cuaca/page/class/class_bottom_cuaca/mobile/landscape.dart';
import 'package:aplikasi_cuaca/page/class/class_bottom_cuaca/mobile/portrait.dart';
import 'package:aplikasi_cuaca/page/class/class_size_device.dart';
import 'package:aplikasi_cuaca/page/class/class_responive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerBottomCuaca extends StatefulWidget {
  final List<String> temperatur, icon, jamCuacaList;
  final String jamCuacaNow;
  const ContainerBottomCuaca({ Key? key, required this.temperatur, required this.icon,
  required this.jamCuacaList, required this.jamCuacaNow}) : super(key: key);

  @override
  State<ContainerBottomCuaca> createState() => _ContainerBottomCuaca();
}

class _ContainerBottomCuaca extends State<ContainerBottomCuaca> with sizeDevice{

  @override
  Widget build(BuildContext context) {
    getsizeDevice(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getHaight(10).h),
      child: OrientationDevice(
        portrait: ContainerBottomCuacaPortrait(temperatur: widget.temperatur, 
          icon: widget.icon, jamCuacaList: widget.jamCuacaList, jamCuacaNow: widget.jamCuacaNow),
        landscape: ContainerBottomCuacaLandscape(temperatur: widget.temperatur, 
          icon: widget.icon, jamCuacaList: widget.jamCuacaList, jamCuacaNow: widget.jamCuacaNow),
      ), 
    );
  }
}