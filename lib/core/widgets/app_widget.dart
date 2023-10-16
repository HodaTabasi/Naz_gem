import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../constants/app_colors.dart';

SizedBox getSpace({w = 0.0, h = 0.0}) {
  return SizedBox(
    width: w,
    height: h,
  );
}

Text getText(text, {size, color, weight, family,align,decoration,maxLines =1}) {
  return Text(text,
      style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: weight,
          fontFamily: family,
      decoration:decoration )
  ,textAlign: align,
  maxLines: maxLines,);
}

Widget getDivider(){
  return const Divider(
    color: Color(0xffD3D3D3),
    thickness: 1,
  );
}

getAppBar({text ,isBack = false ,height,textColor}){
  return AppBar(
    toolbarHeight: height,
    elevation: 0,
    backgroundColor: textColor != null ?Colors.transparent:Colors.white,
    title:  getText(
      text,
      color: textColor ?? blackTextColor,
      size: 20.sp,
    ),
    centerTitle: true,
    automaticallyImplyLeading: false,
    leading: isBack?IconButton(
        onPressed: () {
          Get.back();
        },
        icon:  Icon(Icons.arrow_back, color: textColor != null?Colors.white:Colors.black)):null,
  );
}

Center buildCenterNoData(String message) {
  return Center(
    child: Padding(
      padding:  EdgeInsets.all(16.0.r),
      child: getText(message,size: 16.sp,weight: FontWeight.bold),
    ),
  );
}

