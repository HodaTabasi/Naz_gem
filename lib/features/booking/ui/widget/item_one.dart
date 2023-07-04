import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_widget.dart';
import 'item1_widget/rich_data.dart';
import 'name_of_exercise_widget.dart';

class ItemOneWidget extends StatelessWidget {

  final Color backgroundColor;
  final bool flag;
  const ItemOneWidget({
    super.key,
    required this.flag,
    required this.backgroundColor,

  });



  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 110.h,
      margin: EdgeInsets.symmetric(vertical: 5.r),
      decoration: BoxDecoration(
          color: itemBackgroundColor,
          borderRadius: BorderRadius.circular(10.r)),
      child: Stack(
        children: [
          Container(
            width: 10,
            // height: ,
            decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10.r),
                    bottomRight: Radius.circular(10.r))),
          ),
          PositionedDirectional(
              end: 30.w,
              bottom: 20.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  nameOfExerciseWidget(
                    text1: 'زومبا -',
                    text2: ' ك. أوكسانا',
                  ),
                  Row(
                    children: [
                      RishWidget(
                        text: ' 5-6 مسائًا',
                        icon: Icons.timer_outlined,
                      ),
                      getSpace(w: 8.h),
                      Visibility(
                        visible: flag,
                        child: RishWidget(
                          text: ' تدريب فردي ',
                          icon: Icons.person_outline,
                        ),
                      ),
                      getSpace(w: 16.h),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(95.w, 35.h),
                              textStyle: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.white,
                                  fontFamily: 'br'),
                              backgroundColor: Colors.red.shade600,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(8.r))),
                          onPressed: () {},
                          child: Text('cancel_booking'.tr))
                    ],
                  )
                ],
              )),
        ],
      ),
    );
  }
}
