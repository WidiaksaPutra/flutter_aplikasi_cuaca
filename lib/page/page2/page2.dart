import 'package:aplikasi_cuaca/componen/constans.dart';
import 'package:aplikasi_cuaca/componen/list_cuaca.dart';
import 'package:aplikasi_cuaca/model/weather_daily.dart';
import 'package:aplikasi_cuaca/page/class/class_size_device.dart';
import 'package:aplikasi_cuaca/page/page1/page1.dart';
import 'package:aplikasi_cuaca/page/page2/mobile/lanscape.dart';
import 'package:aplikasi_cuaca/page/page2/mobile/portrait.dart';
import 'package:aplikasi_cuaca/page/page2/skeleton/landscape.dart';
import 'package:aplikasi_cuaca/page/page2/skeleton/portrait.dart';
import 'package:aplikasi_cuaca/service/class_geolocation.dart';
import 'package:aplikasi_cuaca/page/class/class_responive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class Page2 extends StatefulWidget {
  const Page2({ Key? key }) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> with Geolocation, sizeDevice{
  late Future<WeatherDaily> futures = getDataWeatherDaily();  
  final ScrollController scrollController = ScrollController();
  bool loading = false;

  Future _refreshPage() async{
    await Future.delayed(const Duration(milliseconds: 500));
    futures = getDataWeatherDaily();
  }

  @override
  void initState(){
    initializeDateFormatting();
    scrollController.addListener(()async { 
      if(scrollController.position.pixels == scrollController.position.maxScrollExtent && !loading){
        setState(() {
          loading = true;
        });
        await Future.delayed(const Duration(milliseconds: 500 ));
        setState(() {
          futures;
        });
        setState(() {
          loading = false;
        });
      }

    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    getsizeDevice(context);
    return Scaffold(
      body: Container(
        color: blackColor,
        child: FutureBuilder(
        future: futures,
        builder: (context, snapshot){
          if(snapshot.hasData){
            late List<String> iconDaily = []; 
            late List<String> mainDaily = [];
            late List<String> tempDayDaily = [];
            late List<String> feelsLike = [];
            late List<String> day = [];

            for(int i = 1; i < weatherDaily!.daily.length; i++){
              iconDaily.add(weatherDaily!.daily[i].weather[0].icon.toString());
              mainDaily.add(weatherDaily!.daily[i].weather[0].main.toString()); 
              tempDayDaily.add(weatherDaily!.daily[i].temp!.day!.round().toString());
              feelsLike.add(weatherDaily!.daily[i].feelsLike!.day!.round().toString());
              day.add(DateFormat('EEEE').format(DateTime.parse(DateTime.fromMillisecondsSinceEpoch(weatherDaily!.daily[i].dt!.toInt() * 1000).toString())).replaceAll('day' ,'').toString());
              if(DateFormat('EEEE').format(DateTime.parse(DateTime.fromMillisecondsSinceEpoch(weatherDaily!.daily[i].dt!.toInt() * 1000).toString())).toString().contains('nes')){
                day.last = day.last.replaceAll('nes','').toString();
              }
            }

            return LayoutBuilder( builder: (context, constraints){
              return Stack(children: <Widget>[
              RefreshIndicator(
                onRefresh: _refreshPage, 
                child: 
                // ResponsiveDevice(
                //   mobile: 
                  OrientationDevice(
                    portrait: PortraitPage2(icon: weatherDaily!.daily[1].weather[0].icon.toString() ,description: weatherDaily!.daily[1].weather[0].description.toString(),
                      temp: weatherDaily!.daily[1].temp!.day!.round().toString() ,windSpeed: weatherDaily!.daily[1].windSpeed!.round().toString(),
                      rain: weatherDaily!.daily[1].rain!.round().toString(), humidity: weatherDaily!.daily[1].humidity!.round().toString(),
                      feelsLike: weatherDaily!.daily[1].feelsLike!.day!.round().toString(), page: Page1(), 
                      ListExpen: ListExpanded(day, iconDaily, mainDaily, tempDayDaily, feelsLike)),
                    landscape: LanscapePage2(icon: weatherDaily!.daily[1].weather[0].icon.toString() ,description: weatherDaily!.daily[1].weather[0].description.toString(),
                      temp: weatherDaily!.daily[1].temp!.day!.round().toString() ,windSpeed: weatherDaily!.daily[1].windSpeed!.round().toString(),
                      rain: weatherDaily!.daily[1].rain!.round().toString(), humidity: weatherDaily!.daily[1].humidity!.round().toString(),
                      feelsLike: weatherDaily!.daily[1].feelsLike!.day!.round().toString(), page: Page1(), 
                      ListExpen: ListExpanded(day, iconDaily, mainDaily, tempDayDaily, feelsLike)), 
                  ), 
                  // tablet: PortraitPage2(icon: weatherDaily!.daily[1].weather[0].icon.toString() ,description: weatherDaily!.daily[1].weather[0].description.toString(),
                  //     temp: weatherDaily!.daily[1].temp!.day!.round().toString() ,windSpeed: weatherDaily!.daily[1].windSpeed!.round().toString(),
                  //     rain: weatherDaily!.daily[1].rain!.round().toString(), humidity: weatherDaily!.daily[1].humidity!.round().toString(),
                  //     feelsLike: weatherDaily!.daily[1].feelsLike!.day!.round().toString(), page: Page1(), 
                  //     ListExpen: ListExpanded(day, iconDaily, mainDaily, tempDayDaily, feelsLike)),
                // ),
              ),
              if(loading)...[
                Positioned(
                  left: 0,
                  bottom: 0,
                  child: SizedBox(
                    height: getHaight(80).h,
                    width: constraints.maxWidth.w,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
              ],
            ]);
            });
          }else{
            return 
            // const ResponsiveDevice(
            //   mobile: 
              const OrientationDevice(
                portrait: Page2SkeletonPortrait(),
                landscape: Page2SkeletonLandscape()
              );
            //   tablet: Page2SkeletonPortrait(),
            // ); 
          }
        },),
      ),
    );
  }

  Widget ListExpanded(List<String> day, List<String> iconDaily, List<String> mainDaily, List<String> tempDayDaily, List<String> feelsLike) {
    return Expanded(
      child: ListView.builder(
      controller: scrollController,
      scrollDirection: Axis.vertical,
      itemCount: weatherDaily!.daily.length-1,
        itemBuilder: (context, index){
          return ListCuaca(hari: day[index], icon: iconDaily[index], mainCuaca: mainDaily[index], temperatur: tempDayDaily[index], feelsLike: feelsLike[index]);
        },
      ),
    );
  }
}
