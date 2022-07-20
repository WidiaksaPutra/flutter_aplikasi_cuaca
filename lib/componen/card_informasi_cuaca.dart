import 'package:aplikasi_cuaca/componen/constans.dart';
import 'package:aplikasi_cuaca/componen/isi_card_informasi_max.dart';
import 'package:aplikasi_cuaca/componen/isi_card_informasi_min.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardInformasiCuacaMax extends StatelessWidget {
  final String StringUkuranCard;
  const CardInformasiCuacaMax({ Key? key, required this.StringUkuranCard }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: blueColor,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60.r), bottomRight: Radius.circular(60.r)),
        boxShadow: [
          BoxShadow(
            color: blueShadowColor,
            spreadRadius: 0.5.r,
            offset: Offset(0, 7.r),
            blurRadius: 5.0.r,
          ),
        ]
      ),
      child: (StringUkuranCard == "max") 
      ? const IsiCardInformasiMax()
      : const IsiCardInformasiMin()
    );
  }
}