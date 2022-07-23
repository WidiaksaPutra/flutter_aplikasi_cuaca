import 'package:aplikasi_cuaca/componen/constans.dart';
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

class IsiContinerTop extends StatelessWidget {
  final String icon, param1, param2;
  const IsiContinerTop({ Key? key, required this.icon, required this.param1, required this.param2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: SizedBox(
          height: 100.h,
          child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 17.0.w, vertical: 5.0.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.network('http://openweathermap.org/img/wn/$icon.png'),
                Text(param1, textAlign: TextAlign.center, style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold, color: whiteColor, fontFamily: "OpenSauceSans"),),
                Text(param2, textAlign: TextAlign.center, style: TextStyle(fontSize: 12.sp, color: whiteShadowColor, fontFamily: "OpenSauceSans")),
              ],  
            ),
          ),
        ),
      ),
    );
  }
}