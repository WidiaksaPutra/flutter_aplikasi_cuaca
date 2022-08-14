import 'package:aplikasi_cuaca/componen/card_informasi_cuaca/mobile/landscape.dart';
import 'package:aplikasi_cuaca/componen/card_informasi_cuaca/mobile/portrait.dart';
import 'package:aplikasi_cuaca/componen/constans.dart';
import 'package:aplikasi_cuaca/page/class/class_size_device.dart';
import 'package:aplikasi_cuaca/page/class/class_responive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardInformasiCuaca extends StatelessWidget with sizeDevice{
  final Widget child;

  const CardInformasiCuaca({ Key? key, 
  required this.child});

  @override
  Widget build(BuildContext context) {
    getsizeDevice(context);
    return OrientationDevice(
      portrait: CardInformasiCuacaPortrait(child: child),
      landscape: CardInformasiCuacaLandscape(child: child),
    );
  }
}