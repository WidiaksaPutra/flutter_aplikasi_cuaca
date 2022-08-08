import 'package:aplikasi_cuaca/componen/card_informasi_cuaca.dart';
import 'package:aplikasi_cuaca/componen/constans.dart';
import 'package:aplikasi_cuaca/componen/container_top_cuaca.dart';
import 'package:aplikasi_cuaca/page/class/class_size_mediaquery.dart';
import 'package:aplikasi_cuaca/page/class/class_responive.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IsiCardInformasiMax extends StatefulWidget {
  final String nameLokasi, icon, mainCuaca, dateTime, temperatur, windSpeed, humidity, clouds, jamNow;
  const IsiCardInformasiMax({ Key? key, 
  required this.nameLokasi, required this.icon, required this.mainCuaca, 
  required this.temperatur, required this.windSpeed, 
  required this.humidity, required this.clouds, 
  required this.dateTime, required this.jamNow}) : super(key: key);

  @override
  State<IsiCardInformasiMax> createState() => _IsiCardInformasiMaxState();
}

class _IsiCardInformasiMaxState extends State<IsiCardInformasiMax> with sizeMediaquery{
 
  @override
  Widget build(BuildContext context) {
    getSizeMediaquery(context);
    return OrientationDevice(
      portrait: CardInformasiCuaca(
        child: SizedBox(
          width: sizeMediaquery.sizeWidth.w,
          height: (sizeMediaquery.sizeHeight - getHaight(230)).h,
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
                      Text(widget.nameLokasi, style: TextStyle(fontSize: 20.sp, color: whiteColor, fontWeight: FontWeight.bold, fontFamily: "OpenSauceSans")),
                    ],
                  ),
                  const Icon(Icons.more_vert, color: Colors.white),
                ],
              ),
              (getWidthVisible() == false) 
              ? Padding(padding: EdgeInsets.symmetric(vertical: getHaight(3).h), child: Text("Updated ${widget.jamNow}min ago", style: TextStyle(fontSize: 12.sp, color: whiteColor, fontWeight: FontWeight.bold, fontFamily: "OpenSauceSans") ,textAlign: TextAlign.center))
              : Container(
                width: getWidth(130).w,
                decoration: BoxDecoration(
                  border: Border.all(width: getWidth(1).w, color: whiteColor),
                  borderRadius: BorderRadius.all(Radius.circular(25.r)),
                ), 
                child: Padding(padding: EdgeInsets.symmetric(vertical: getHaight(3).h), child: Text("Updated ${widget.jamNow}min ago", style: TextStyle(fontSize: 12.sp, color: whiteColor, fontWeight: FontWeight.bold, fontFamily: "OpenSauceSans") ,textAlign: TextAlign.center)),
              ),
              (getWidthVisible() == false || getHeightVisible() == false) ? const Text("") : Image.network('http://openweathermap.org/img/wn/${widget.icon}@2x.png'),
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(" ${widget.temperatur}", 
                        style: TextStyle(fontSize: (getHeightVisible() == false) ? 60.sp : 100.sp, 
                          color: whiteColor, 
                          fontWeight: FontWeight.bold,
                          fontFamily: "OpenSauceSans", 
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text("°", style: TextStyle(fontSize: (getHeightVisible() == false) ? 30.sp : 60.sp, color: whiteShadowColor, fontWeight: FontWeight.bold, fontFamily: "OpenSauceSans")),
                  ],),
                  Text(widget.mainCuaca, style: TextStyle(fontSize: 30.sp, color: whiteColor, fontWeight: FontWeight.bold, fontFamily: "OpenSauceSans")),
                  Text("Today, ${DateFormat('dd MMMM').format(DateTime.parse(widget.dateTime)).toString()}", style: TextStyle(fontSize: 15.sp, color: whiteShadowColor, fontWeight: FontWeight.bold, fontFamily: "OpenSauceSans")),
                ],
              ),
              ContainerTopCuaca(icon: widget.icon.toString(), speed: widget.windSpeed, humidity: widget.humidity, clouds: widget.clouds),
            ],
          ),     
        ),
      ), 
      landscape: CardInformasiCuaca(
        child: SizedBox(
          width: (sizeMediaquery.sizeWidth - getHaight(230)).w,
          height: sizeMediaquery.sizeHeight.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(Icons.grid_view_rounded, color: Colors.white), 
                  Column(
                    children: [
                      const Icon(Icons.location_on_rounded, color: Colors.white),
                      Text(widget.nameLokasi, style: TextStyle(fontSize: 20.sp, color: whiteColor, fontWeight: FontWeight.bold, fontFamily: "OpenSauceSans")),
                    ],
                  ),
                  const Icon(Icons.more_vert, color: Colors.white),
                ],
              ),
              (getWidthVisible() == false) 
              ? Padding(padding: EdgeInsets.symmetric(horizontal: getWidth(3).w), child: Text("Updated ${widget.jamNow}min ago", style: TextStyle(fontSize: 12.sp, color: whiteColor, fontWeight: FontWeight.bold, fontFamily: "OpenSauceSans") ,textAlign: TextAlign.center))
              : Container(
                width: getWidth(130).w,
                decoration: BoxDecoration(
                  border: Border.all(width: getWidth(1).w, color: whiteColor),
                  borderRadius: BorderRadius.all(Radius.circular(25.r)),
                ), 
                child: Padding(padding: EdgeInsets.symmetric(vertical: getWidth(3).w), child: Text("Updated ${widget.jamNow}min ago", style: TextStyle(fontSize: 12.sp, color: whiteColor, fontWeight: FontWeight.bold, fontFamily: "OpenSauceSans") ,textAlign: TextAlign.center)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                (getWidthVisible() == false) ? const Text("") : Image.network('http://openweathermap.org/img/wn/${widget.icon}@2x.png'),
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(" ${widget.temperatur}", 
                          style: TextStyle(fontSize: (getHeightVisible() == false) ? 50.sp : 100.sp, 
                            color: whiteColor, 
                            fontWeight: FontWeight.bold,
                            fontFamily: "OpenSauceSans", 
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text("°", style: TextStyle(fontSize: (getHeightVisible() == false) ? 20.sp : 60.sp, color: whiteShadowColor, fontWeight: FontWeight.bold, fontFamily: "OpenSauceSans")),
                    ],),
                    Text(widget.mainCuaca, style: TextStyle(fontSize: 30.sp, color: whiteColor, fontWeight: FontWeight.bold, fontFamily: "OpenSauceSans")),
                    Text("Today, ${DateFormat('dd MMMM').format(DateTime.parse(widget.dateTime)).toString()}", style: TextStyle(fontSize: 15.sp, color: whiteShadowColor, fontWeight: FontWeight.bold, fontFamily: "OpenSauceSans")),
                  ],
                ),
              ]),
              ContainerTopCuaca(icon: widget.icon.toString(), speed: widget.windSpeed, humidity: widget.humidity, clouds: widget.clouds),
            ],
          ),     
        ),
      ),
    );
  }
}
