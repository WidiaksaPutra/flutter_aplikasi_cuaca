import 'package:aplikasi_cuaca/componen/isi_container_cuaca.dart';
import 'package:aplikasi_cuaca/componen/skeleton.dart';
import 'package:aplikasi_cuaca/service/classGeolocation.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerBottomCuaca extends StatefulWidget {
  const ContainerBottomCuaca({ Key? key }) : super(key: key);

  @override
  State<ContainerBottomCuaca> createState() => _ContainerBottomCuaca();
}

class _ContainerBottomCuaca extends State<ContainerBottomCuaca> with Geolocation{
  
  @override
  void initState() {
    initializeDateFormatting();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      getDataWeatherHourly();
    });
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: FutureBuilder(
        future: getDataWeatherHourly(),
        builder: (context, snapshot){
        if(snapshot.hasData){
          late List<DateTime> jamCuacaList = [];
          for(int i = 0; i < 4 ; i++){
            jamCuacaList.add(DateTime.fromMillisecondsSinceEpoch(weatherHour!.hourly[i].dt!.toInt() * 1000));
          }
          return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for(int a = 0 ; a < 4 ; a ++)...[
                IsiContainerTopBottom(
                  validasi: "bottom",
                  param1: weatherHour!.hourly[a].temp!.round().toString(),
                  icon: weatherHour!.hourly[a].weather[0].icon.toString(),
                  param2: DateFormat('HH:mm', 'id').format(DateTime.parse(jamCuacaList[a].toString())).toString()
                ),
              ]
            ],
          );
        }else{
          return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for(int a = 0 ; a < 4 ; a ++)...[
                Skeleton(width: 80.w, hight: 140.h, jenis: "bottomCard"),
              ]
            ],
          );
        }
      }),
    );
  }
}