import 'package:aplikasi_cuaca/componen/Isi_continer_top/container_top_cuaca.dart';
import 'package:aplikasi_cuaca/componen/card_informasi_cuaca/card_informasi_cuaca.dart';
import 'package:aplikasi_cuaca/componen/constans.dart';
import 'package:aplikasi_cuaca/page/class/class_size_device.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:intl/intl.dart';

class IsiCardInformasiMaxPortrait extends StatelessWidget with sizeDevice{
  final String nameLokasi, icon, mainCuaca, dateTime, temperatur, windSpeed, humidity, clouds, jamNow;
  const IsiCardInformasiMaxPortrait({ Key? key, required this.nameLokasi, required this.icon, 
  required this.mainCuaca, required this.temperatur, required this.windSpeed, 
  required this.humidity, required this.clouds, required this.dateTime, required this.jamNow }) 
  : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardInformasiCuaca(
      child: SizedBox(
        width: sizeDevice.sizeWidth.w,
        height: (sizeDevice.sizeHeight - getHaight(230)).h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Icon(Icons.grid_view_rounded, color: Colors.white), 
                Row(
                  children: [
                    const Icon(Icons.location_on_rounded, color: Colors.white),
                    Text(nameLokasi, style: TextStyle(fontSize: 20.sp, color: whiteColor, fontWeight: FontWeight.bold, fontFamily: "OpenSauceSans")),
                  ],
                ),
                const Icon(Icons.more_vert, color: Colors.white),
              ],
            ),
            (getWidthVisiblePortrait() == false) 
            ? Padding(padding: EdgeInsets.symmetric(vertical: getHaight(3).h), child: Text("Updated ${jamNow}min ago", style: TextStyle(fontSize: 12.sp, color: whiteColor, fontWeight: FontWeight.bold, fontFamily: "OpenSauceSans") ,textAlign: TextAlign.center))
            : Container(
              width: getWidth(130).w,
              decoration: BoxDecoration(
                border: Border.all(width: getWidth(1).w, color: whiteColor),
                borderRadius: BorderRadius.all(Radius.circular(25.r)),
              ), 
              child: Padding(padding: EdgeInsets.symmetric(vertical: getHaight(3).h), child: Text("Updated ${jamNow}min ago", style: TextStyle(fontSize: 12.sp, color: whiteColor, fontWeight: FontWeight.bold, fontFamily: "OpenSauceSans") ,textAlign: TextAlign.center)),
            ),
            (getWidthVisiblePortrait() == false || getHeightVisiblePortrait() == false) ? const Text("") : Image.network('http://openweathermap.org/img/wn/$icon@2x.png'),
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(" $temperatur", 
                      style: TextStyle(fontSize: (getHeightVisiblePortrait() == false) ? 60.sp : 100.sp, 
                        color: whiteColor, 
                        fontWeight: FontWeight.bold,
                        fontFamily: "OpenSauceSans", 
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text("°", style: TextStyle(fontSize: (getHeightVisiblePortrait() == false) ? 30.sp : 60.sp, color: whiteShadowColor, fontWeight: FontWeight.bold, fontFamily: "OpenSauceSans")),
                ],),
                Text(mainCuaca, style: TextStyle(fontSize: 30.sp, color: whiteColor, fontWeight: FontWeight.bold, fontFamily: "OpenSauceSans")),
                Text("Today, ${DateFormat('dd MMMM').format(DateTime.parse(dateTime)).toString()}", style: TextStyle(fontSize: 15.sp, color: whiteShadowColor, fontWeight: FontWeight.bold, fontFamily: "OpenSauceSans")),
              ],
            ),
            ContainerTopCuaca(icon: icon.toString(), speed: windSpeed, humidity: humidity, clouds: clouds),
          ],
        ),     
      ),
    );
  }
}