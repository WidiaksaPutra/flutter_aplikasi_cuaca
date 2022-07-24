import 'package:aplikasi_cuaca/componen/constans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListCuaca extends StatefulWidget {
  final String hari,icon,mainCuaca,temperatur,feelsLike;
  const ListCuaca({ Key? key, 
  required this.hari, required this.icon,
  required this.mainCuaca, required this.temperatur,  
  required this.feelsLike}) : super(key: key);

  @override
  State<ListCuaca> createState() => _ListCuacaState();
}

class _ListCuacaState extends State<ListCuaca>{
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(widget.hari, style: TextStyle(fontSize: 18.sp, color: whiteShadowColor, fontFamily: "OpenSauceSans")),
        Row(
          children: [
            Image.network('http://openweathermap.org/img/wn/${widget.icon}.png'),
            Text(widget.mainCuaca, style: TextStyle(fontSize: 18.sp, color: whiteShadowColor, fontFamily: "OpenSauceSans")),
          ],
        ),
        Row(children: [
          Text("+${widget.temperatur}°", style: TextStyle(fontSize: 18.sp, color: whiteColor, fontFamily: "OpenSauceSans")),
          Text("+${widget.feelsLike}°", style: TextStyle(fontSize: 18.sp, color: whiteShadowColor, fontFamily: "OpenSauceSans")),
        ],)
      ],),
    );
  }
}