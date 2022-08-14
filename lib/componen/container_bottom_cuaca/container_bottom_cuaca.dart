import 'package:aplikasi_cuaca/componen/constans.dart';
import 'package:aplikasi_cuaca/componen/container_bottom_cuaca/mobile/landscape.dart';
import 'package:aplikasi_cuaca/componen/container_bottom_cuaca/mobile/portrait.dart';
import 'package:aplikasi_cuaca/page/class/class_size_device.dart';
import 'package:aplikasi_cuaca/page/class/class_responive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContinerBottom extends StatelessWidget with sizeDevice{
  final String param1, icon, param2, light;
  const ContinerBottom({Key? key, required this.param1, required this.icon, required this.param2, required this.light}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getsizeDevice(context);
    return OrientationDevice(
      portrait: ContinerBottomPortrait(param1: param1, icon: icon, param2: param2, light: light),
      landscape: ContinerBottomLandscape(param1: param1, icon: icon, param2: param2, light: light),
    );
  }
}