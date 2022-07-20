import 'package:aplikasi_cuaca/componen/constans.dart';
import 'package:aplikasi_cuaca/componen/container_top_cuaca.dart';
import 'package:aplikasi_cuaca/componen/skeleton.dart';
import 'package:aplikasi_cuaca/service/classGeolocation.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IsiCardInformasiMax extends StatefulWidget {
  const IsiCardInformasiMax({ Key? key }) : super(key: key);

  @override
  State<IsiCardInformasiMax> createState() => _IsiCardInformasiMaxState();
}

class _IsiCardInformasiMaxState extends State<IsiCardInformasiMax> with Geolocation{
 
  @override
  void initState() {
    initializeDateFormatting();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    setState(() {
      getDataWeatherNow();
    });
    return SizedBox(
      width: size.width.w,
      height: (size.height.h - 230.h),
      child: FutureBuilder(
        future: getDataWeatherNow(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            late DateTime dateTimeNow = DateTime.fromMillisecondsSinceEpoch(weatherNow!.dt!.toInt() * 1000);
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.location_on_rounded, color: Colors.white),
                    Text(weatherNow!.name.toString(), style: TextStyle(fontSize: 20.sp, color: whiteColor, fontWeight: FontWeight.bold)),
                ],),
                Container(
                  width: 100.w,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.w, color: whiteColor),
                    borderRadius: BorderRadius.all(Radius.circular(25.r)),
                  ),
                  child: Padding(padding: EdgeInsets.symmetric(vertical: 3.h), child: Text("Updating", style: TextStyle(fontSize: 13.sp, color: whiteColor, fontWeight: FontWeight.bold) ,textAlign: TextAlign.center)),
                ),
                Image.network('http://openweathermap.org/img/wn/${weatherNow!.weather[0].icon}@2x.png'),
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(weatherNow!.main!.temp!.round().toString(), 
                          style: TextStyle(fontSize: 90.sp, 
                          color: whiteColor, 
                          fontWeight: FontWeight.bold, 
                          shadows: [Shadow(color: whiteShadowColor, offset: Offset(0, 5.r), blurRadius: 7.0.r,)],
                          ),
                        ),
                        Text("°", style: TextStyle(fontSize: 60.sp, color: whiteShadowColor, fontWeight: FontWeight.bold)),
                    ],),
                    Text(weatherNow!.weather[0].main.toString(), style: TextStyle(fontSize: 20.sp, color: whiteColor, fontWeight: FontWeight.bold)),
                    Text(DateFormat('EEEE, dd MMMM yyyy', 'id').format(DateTime.parse(dateTimeNow.toString())).toString(), style: TextStyle(fontSize: 15.sp, color: whiteShadowColor, fontWeight: FontWeight.bold)),
                  ],
                ),
                ContainerTopCuaca(iconCuaca1: weatherNow!.weather[0].icon.toString(), iconCuaca2: weatherNow!.weather[0].icon.toString(), iconCuaca3: weatherNow!.weather[0].icon.toString(), speed: weatherNow!.wind!.speed!.round().toString(), humidity: weatherNow!.main!.humidity!.round().toString(), clouds: weatherNow!.clouds!.all!.round().toString()),
              ],
            );
          }else{
            return Skeleton(width: size.width.w, hight: (size.height.h - 230.h), jenis: "topCard");
          } 
        }
      ) 
    );
  }
}