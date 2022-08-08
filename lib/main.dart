import 'package:aplikasi_cuaca/page/page1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
       home: MainScreen(), 
    );
  }
}


class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    late Size size = MediaQuery.of(context).size;
    late double screenW = size.width;
    late double screenH = size.height;
    return ScreenUtilInit(
      designSize: Size(screenW , screenH),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => GestureDetector(//untuk menyediakan trigger klik seperti onTap,onClick, dls
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);//???
        if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus!.unfocus();
        }
      },
      child: const GetMaterialApp(
        home: Page1(),
      ),
    ),);
  }
}
