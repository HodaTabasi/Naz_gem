import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:naz_gem/core/constants/app_widget.dart';

import '../../../../core/constants/app_colors.dart';
import 'item2_widget/rish_data.dart';
import 'name_of_exercise_widget.dart';

class ItemTwoWidget extends StatelessWidget {
  final String image;
  final Color backgroundColor;

  const ItemTwoWidget({
    super.key,
    required this.image,
    required this.backgroundColor
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 220.h,
      margin: EdgeInsets.symmetric(vertical: 5.r),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          image:  DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover)),
      child: Stack(
        children: [
          PositionedDirectional(
              child: Padding(
                padding:  EdgeInsets.all(16.0.r),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getSpace(h:8.r),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20.r,
                          backgroundColor: Color(0xffF5F5F5),
                          child: SvgPicture.asset('assets/images/ll.svg'),
                        ),
                        getSpace(w: 8.r),
                        nameOfExerciseWidget(
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp
                          ),
                          text1: 'زومبا -',
                          text2: ' ك. أوكسانا',
                        ),
                      ],
                    ),
                    getSpace(h:16.r),
                    RishWidget(backgroundColor: backgroundColor,icon: Icons.timer_outlined,text: ' 5-6 مسائًا',),
                    getSpace(h: 8.r),
                    RishWidget(backgroundColor: backgroundColor,icon: Icons.person_outline,text: ' تدريب فردي ',),
                  ],
                ),
              )),
          PositionedDirectional(
            start: 0,
            end: 0,
            bottom: 0,
            child: Container(
              height: 50.h,
              decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.r),
                      bottomRight: Radius.circular(10.r))),
              child: Padding(
                padding: EdgeInsets.only(top: 8.0.r),
                child: Text(
                  'book_now'.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: blackTextColor, fontSize: 16.sp),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

