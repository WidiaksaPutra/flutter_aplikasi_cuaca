import 'package:aplikasi_cuaca/componen/constans.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListViewCuaca extends StatefulWidget {
  final List<String> hari,icon,mainCuaca,temperatur;
  final int dataLength;
  final ScrollController scrollController;
  const ListViewCuaca({ Key? key, 
  required this.hari, required this.icon,
  required this.mainCuaca, required this.temperatur, 
  required this.dataLength, required this.scrollController}) : super(key: key);

  @override
  State<ListViewCuaca> createState() => _ListViewCuacaState();
}

class _ListViewCuacaState extends State<ListViewCuaca>{

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
      controller: widget.scrollController,
      scrollDirection: Axis.vertical,
      itemCount: widget.dataLength,
      itemBuilder: (context, index){
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(DateFormat('EEEE').format(DateTime.parse(widget.hari[index])), style: TextStyle(fontSize: 20.sp, color: whiteShadowColor)),
            Row(
              children: [
                Image.network('http://openweathermap.org/img/wn/${widget.icon[index]}.png'),
                Text(widget.mainCuaca[index], style: TextStyle(fontSize: 20.sp, color: whiteShadowColor)),
              ],
            ),
            Text("${widget.temperatur[index]}°", style: TextStyle(fontSize: 20.sp, color: whiteShadowColor)),
          ],),
        );
      }),
    );
  }
}