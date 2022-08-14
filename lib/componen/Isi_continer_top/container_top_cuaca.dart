import 'package:aplikasi_cuaca/componen/Isi_continer_top/mobile/landscape.dart';
import 'package:aplikasi_cuaca/componen/Isi_continer_top/mobile/portrait.dart';
import 'package:aplikasi_cuaca/componen/constans.dart';
import 'package:aplikasi_cuaca/page/class/class_size_device.dart';
import 'package:aplikasi_cuaca/page/class/class_responive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerTopCuaca extends StatefulWidget {
  final String icon, speed, humidity, clouds;
  const ContainerTopCuaca({ Key? key, required this.icon, required this.speed, required this.humidity, required this.clouds}) : super(key: key);

  @override
  State<ContainerTopCuaca> createState() => _ContainerTopCuaca();
}

class _ContainerTopCuaca extends State<ContainerTopCuaca> {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IsiContinerTop(
          icon: widget.icon,
          param1: "${widget.speed}kmph", 
          param2: "Wind",
        ),
        IsiContinerTop(
          icon: widget.icon,
          param1: "${widget.humidity}%", 
          param2: "Humidity",
        ),
        IsiContinerTop(
          icon: widget.icon,
          param1: "${widget.clouds}%", 
          param2: "Chance of rain",
        ),
      ],
    );
  }
}

class IsiContinerTop extends StatelessWidget with sizeDevice{
  final String icon, param1, param2;
  const IsiContinerTop({ Key? key, required this.icon, required this.param1, required this.param2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getsizeDevice(context);
    return Expanded(
      flex: 3,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getWidth(4).w),
        child: OrientationDevice(
          portrait: IsiContinerTopPortrait(icon: icon, param1: param1, param2: param2),
          landscape: IsiContinerTopLandscape(icon: icon, param1: param1, param2: param2),
        ),
      ),
    );
  }
}