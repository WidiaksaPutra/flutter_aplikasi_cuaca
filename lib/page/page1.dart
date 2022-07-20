import 'package:aplikasi_cuaca/componen/card_informasi_cuaca.dart';
import 'package:aplikasi_cuaca/componen/constans.dart';
import 'package:aplikasi_cuaca/componen/container_bottom_cuaca.dart';
import 'package:aplikasi_cuaca/page/page2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Page1 extends StatefulWidget {
  const Page1({ Key? key }) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1>{

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        color: blackColor,
        child: Column(children: [
          const CardInformasiCuacaMax(StringUkuranCard: "max"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text("Today", style: TextStyle(fontSize: 20.sp, color: Colors.white),),
            TextButton(
              onPressed: () async {
                Get.to(const Page2());
              },
              child: Row(children: [
                Text("7 days ", style: TextStyle(fontSize: 15.sp, color: Colors.grey)),
                Icon(Icons.arrow_forward_ios_outlined, color: Colors.grey, size: 13.r,)
              ],),
            ),
        ],),
        const ContainerBottomCuaca(),
        ]
      ),
    ),);
  }
}