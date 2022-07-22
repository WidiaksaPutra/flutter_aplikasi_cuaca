import 'package:aplikasi_cuaca/componen/constans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class ContainerBottomCuaca extends StatefulWidget {
  final List<String> temperatur, icon, jamCuacaList;
  const ContainerBottomCuaca({ Key? key, required this.temperatur, required this.icon, required this.jamCuacaList}) : super(key: key);

  @override
  State<ContainerBottomCuaca> createState() => _ContainerBottomCuaca();
}

class _ContainerBottomCuaca extends State<ContainerBottomCuaca> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for(int a = 0 ; a < 4 ; a ++)...[
            IsiContinerBottom(
              param1: widget.temperatur[a],
              icon: widget.icon[a],
              param2: DateFormat('HH:mm', 'id').format(DateTime.parse(widget.jamCuacaList[a].toString())).toString()
            ),
          ]
        ],
      ),
    );
  }
}

class IsiContinerBottom extends StatelessWidget {
  final String param1, icon, param2;
  const IsiContinerBottom({Key? key,required this.param1, required this.icon, required this.param2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.h,
      width: 80.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35.r),
        border: Border.all(color: whiteShadowColor, width: 1.w),
        boxShadow: [ 
          BoxShadow(
            color: blackColor,
            blurRadius: 2.0.r,
            spreadRadius: 0.1.r,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 17.0.w, vertical: 17.0.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("$param1°", textAlign: TextAlign.center, style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold, color: whiteColor),),
            Image.network('http://openweathermap.org/img/wn/$icon.png'),
            Text(param2, textAlign: TextAlign.center, style: TextStyle(fontSize: 13.sp, color: whiteShadowColor)),
          ],  
        ),
      ),
    );
  }
}