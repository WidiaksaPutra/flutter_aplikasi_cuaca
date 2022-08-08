import 'package:aplikasi_cuaca/page/class/class_size_mediaquery.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ResponsiveDevice extends StatelessWidget with sizeMediaquery{
  final Widget mobile;
  final Widget tablet;
  const ResponsiveDevice({ Key? key, required this.mobile, required this.tablet }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (BuildContext context, SizingInformation sizingInformation) {  
      if(sizingInformation.deviceScreenType == DeviceScreenType.tablet){
        if(tablet != null){
          return tablet;
        }
      }
      return mobile;
    });
  }
}

class OrientationDevice extends StatelessWidget {
  final Widget landscape;
  final Widget portrait;
  const OrientationDevice({ Key? key, required this.landscape, required this.portrait }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    if(orientation == Orientation.landscape){
      return landscape;
    }
    return portrait;
  }
}