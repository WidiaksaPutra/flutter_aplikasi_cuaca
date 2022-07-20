import 'package:aplikasi_cuaca/componen/card_informasi_cuaca.dart';
import 'package:aplikasi_cuaca/componen/constans.dart';
import 'package:aplikasi_cuaca/componen/list_view_cuaca.dart';
import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  const Page2({ Key? key }) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: blackColor,
        child: Column(
          children: const [
            CardInformasiCuacaMax(StringUkuranCard: "min"),
            ListViewCuaca(),
          ],
        ),),
    );
  }
}