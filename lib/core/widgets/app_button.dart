import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';




class BtnApp extends StatelessWidget {
  late String title;
  late VoidCallback prsee;
  late Color color;
  late Color textColor;


  BtnApp({required this.title,required this.prsee,required this.color,this.textColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 16.0.r),
        height: 50.h,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0.r),
          clipBehavior: Clip.hardEdge,
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(color),
                padding: MaterialStateProperty.all(EdgeInsets.all(10.r)),
                textStyle: MaterialStateProperty.all(TextStyle(fontSize: 18.sp,color: textColor))),
            onPressed: prsee,
            child: Text("$title",style: TextStyle(fontSize: 18.sp,color: textColor,fontWeight: FontWeight.w500,fontFamily: 'br'),),

          ),
        ),
      ),
    );
  }
}
