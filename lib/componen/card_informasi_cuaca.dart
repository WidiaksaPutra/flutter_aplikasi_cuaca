import 'package:aplikasi_cuaca/componen/constans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardInformasiCuaca extends StatelessWidget {
  final Widget child;

  const CardInformasiCuaca({ Key? key, 
  required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: blueColorShadow3,
            spreadRadius: -20.r,
            offset: Offset(0.r, 70.r),
            blurRadius: 50.0.r,
          ),
          BoxShadow(
            color: blueColorShadow2,
            spreadRadius: -4.r,
            offset: Offset(0.r, 15.r),
            blurRadius: 3.0.r,
          ),
          BoxShadow(
            color: blueColorShadow1,
            spreadRadius: 1.5.r,
          ),
        ],
        gradient: const LinearGradient(
          colors: [
            blueColor1,
            blueColor2
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter
        ),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60.r), bottomRight: Radius.circular(60.r)),
      ),
      child: child,
    );
  }
}