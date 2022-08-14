import 'package:flutter/cupertino.dart';

mixin sizeDevice{
  static late MediaQueryData mediaQuery;
  static late double sizeHeight, sizeWidth;
  void getsizeDevice(BuildContext context){
    mediaQuery = MediaQuery.of(context);
    sizeHeight = mediaQuery.size.height;
    sizeWidth = mediaQuery.size.width;
  }

  double getHaight(double inputHeight){
    if (sizeHeight <= 480.0) {
      return (inputHeight / 393.0) * sizeHeight;
    } else if (sizeHeight > 480.0 && sizeHeight <= 600.0) {
      return (inputHeight / 534.0) * sizeHeight;
    } else if (sizeHeight > 600.0 && sizeHeight <= 840.0){
      return (inputHeight / 732.0) * sizeHeight;
    } else if(sizeHeight > 840.0 && sizeHeight <= 960.0) {
      return (inputHeight / 879.0) * sizeHeight;
    } else if(sizeHeight > 960.0 && sizeHeight < 1280.0){
      return (inputHeight/ 1080.0) * sizeHeight;
    } else if(sizeHeight >= 1280.0 && sizeHeight <= 1600.0){
      return (inputHeight/ 1280.0) * sizeHeight;
    } else {
      return (inputHeight / 1707.0) * sizeHeight;
    }
  }

  double getWidth(double inputWidth){
    if (sizeWidth <= 480.0) {
      return (inputWidth / 393.0) * sizeWidth;
    } else if (sizeWidth > 480.0 && sizeWidth <= 600.0) {
      return (inputWidth / 534.0) * sizeWidth;
    } else if (sizeWidth > 600.0 && sizeWidth <= 840.0){
      return (inputWidth / 732.0) * sizeWidth;
    } else if(sizeWidth > 840.0 && sizeWidth <= 960.0) {
      return (inputWidth / 879.0) * sizeWidth;
    } else if(sizeWidth > 960.0 && sizeWidth < 1280.0){
      return (inputWidth/ 1080.0) * sizeWidth;
    } else if(sizeWidth >= 1280.0 && sizeWidth <= 1600.0){
      return (inputWidth/ 1280.0) * sizeWidth;
    } else {
      return (inputWidth / 1707.0) * sizeWidth;
    }
  }

  bool getWidthVisiblePortrait(){
    if(sizeWidth < 360.0) {
      return false;
    } else{
      return true;
    }
  }

  bool getHeightVisiblePortrait(){
    if(sizeHeight < 670.0) {
      return false;
    } else{
      return true;
    }
  }

  bool getWidthVisibleLanscape(){
    if(sizeWidth < 390.0) {
      return false;
    } else{
      return true;
    }
  }

  bool getHeightVisibleLanscape(){
    if(sizeHeight < 300.0) {
      return false;
    } else{
      return true;
    }
  }
}
