import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';



class BtnApp extends StatelessWidget {
  late String title;
  late VoidCallback prsee;


  BtnApp({required this.title,required this.prsee});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(16.0.r),
        height: 50.h,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0.r),
          clipBehavior: Clip.hardEdge,
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(mainColor),
                padding: MaterialStateProperty.all(EdgeInsets.all(10.r)),
                textStyle: MaterialStateProperty.all(TextStyle(fontSize: 18.sp,color: blackTextColor))),
            onPressed: prsee,
            child: Text("$title",style: TextStyle(fontSize: 18.sp,color: blackTextColor,fontWeight: FontWeight.w500,fontFamily: 'avenir'),),

          ),
        ),
      ),
    );
  }
}
