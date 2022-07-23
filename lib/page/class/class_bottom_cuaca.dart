import 'package:aplikasi_cuaca/componen/container_bottom_cuaca.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          for(int a = 0 ; a < widget.temperatur.length ; a ++)...[
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