import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:naz_gem/features/home/ui/widgets/widget_functions.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/app_widget.dart';
import '../../../subscrbtions/ui/pages/subscrbtion_screen.dart';

class PakageItemWidget extends StatelessWidget {
  const PakageItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(
                color: boarderColorPakage,
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 2,
                    offset: Offset(0, 4))
              ],
              color: Colors.white),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              getSpace(h: 25.h),
              getText("شهر واحد",
                  color: grayTextColor,
                  size: 13.sp,
                  align: TextAlign.center),
              getSpace(h: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  getText("2000 ريال",
                      color: grayTextColor1,
                      size: 15.sp,
                      align: TextAlign.center,
                      decoration: TextDecoration.lineThrough),
                  getSpace(w: 10.w),
                  getText("1200 ريال",
                      color: blackTextColor,
                      size: 16.sp,
                      weight: FontWeight.bold,
                      align: TextAlign.center),
                ],
              )
            ],
          ),
        ),
        PositionedDirectional(
          bottom: 0,
          end: 0,
          child: InkWell(
            onTap: () {
              Get.to(() => Subscrbtions());
            },
            child: Container(
              width: 85.w,
              height: 35.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12.r),
                      topRight: Radius.circular(12.r)),
                  color: mainColor),
              child: getText('sub'.tr,
                  color: blackTextColor,
                  size: 14.sp,
                  align: TextAlign.center),
            ),
          ),
        ),
        PositionedDirectional(
          bottom: 0,
          start: 0,
          child: InkWell(
            onTap: () {
              showDitailsDialog(context);
            },
            child: SizedBox(
              width: 85.w,
              height: 35.h,
              child: getText('details'.tr,
                  color: sucndryColor1,
                  size: 14.sp,
                  align: TextAlign.center),
            ),
          ),
        )
      ],
    );
  }
}