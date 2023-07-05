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

Text getText(text, {size, color, weight, family,align,decoration}) {
  return Text(text,
      style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: weight,
          fontFamily: family,
      decoration:decoration )
  ,textAlign: align,);
}

Widget getDivider(){
  return const Divider(
    color: Color(0xffD3D3D3),
    thickness: 1,
  );
}

getAppBar({text ,isBack = false ,height }){
  return AppBar(
    toolbarHeight: height,
    elevation: 0,
    backgroundColor: Colors.white,
    title:  getText(
      text,
      color: blackTextColor,
      size: 20.sp,
    ),
    centerTitle: true,
    automaticallyImplyLeading: false,
    leading: isBack?IconButton(
        onPressed: () {
          Get.back();
        },
        icon: Icon(Icons.arrow_back, color: Colors.black)):null,
  );
}

