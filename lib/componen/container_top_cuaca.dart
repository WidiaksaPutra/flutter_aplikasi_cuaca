import 'package:aplikasi_cuaca/componen/isi_container_cuaca.dart';
import 'package:flutter/material.dart';

class ContainerTopCuaca extends StatefulWidget {
  final String iconCuaca1, iconCuaca2, iconCuaca3, speed, humidity, clouds;
  const ContainerTopCuaca({ Key? key, required this.iconCuaca1, required this.iconCuaca2, required this.iconCuaca3, required this.speed, required this.humidity, required this.clouds}) : super(key: key);

  @override
  State<ContainerTopCuaca> createState() => _ContainerTopCuaca();
}

class _ContainerTopCuaca extends State<ContainerTopCuaca> {

  @override
  Widget build(BuildContext context) {
      List<String> iconCuacaList = [widget.iconCuaca1, widget.iconCuaca2, widget.iconCuaca3];
      List<String> nilaiCuacaList = ["${widget.speed}kmph", "${widget.humidity}%", "${widget.clouds}%"];
      List<String> jenisNilaiCuacaList = ["Wind", "Humidity", "Chance of rain"];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for(int a = 0 ; a < nilaiCuacaList.length ; a ++)...[
          IsiContainerTopBottom(
            validasi: "top",
            icon: iconCuacaList[a],
            param1: nilaiCuacaList[a], 
            param2: jenisNilaiCuacaList[a],
          ),
        ]
      ],
    );
  }
}