import 'package:aplikasi_cuaca/componen/constans.dart';
import 'package:aplikasi_cuaca/page/class/class_size_device.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

class IsiContinerTopLandscape extends StatelessWidget with sizeDevice {
  final String icon, param1, param2;
  const IsiContinerTopLandscape({ Key? key, required this.icon, required this.param1, required this.param2  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getHaight(50).h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          (getHeightVisibleLanscape() == false) ? const Text("") : Image.network('http://openweathermap.org/img/wn/$icon.png'),
          Text(param1, textAlign: TextAlign.center, style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold, color: whiteColor, fontFamily: "OpenSauceSans"),),
          Text(param2, textAlign: TextAlign.center, style: TextStyle(fontSize: 12.sp, color: whiteShadowColor, fontFamily: "OpenSauceSans")),
        ],  
      ),
    );
  }
}