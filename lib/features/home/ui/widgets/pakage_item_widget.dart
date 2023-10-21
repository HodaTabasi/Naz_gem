import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:naz_gem/features/auth/ui/pages/login.dart';
import 'package:naz_gem/features/home/domain/entities/packages.dart';
import 'package:naz_gem/features/home/ui/get/home_getx_controller.dart';
import 'package:naz_gem/features/home/ui/widgets/widget_functions.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/utils.dart';
import '../../../../core/widgets/app_widget.dart';
import '../../../subscrbtions/ui/get/subscrbtions_getx_controller.dart';
import '../../../subscrbtions/ui/pages/subscrbtion_screen.dart';

class PakageItemWidget extends StatelessWidget {
  Package currentPackag;
  PakageItemWidget(this.currentPackag,  {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetX<HomeGetxController>(builder: (controller) {
       var priceAfterDiscount = getDiscount(currentPackag);
      // if(currentPackag.discounts!.isNotEmpty){
      //   priceAfterDiscount = currentPackag.discounts!.first.ratio! * num.parse(currentPackag.price!) / 100;
      //   print(priceAfterDiscount);
      // }

      return Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(
                  color: boarderColorPakage,
                  width: 1,
                ),
                // boxShadow: [
                //   BoxShadow(
                //       color: Colors.grey.shade300,
                //       blurRadius: 2,
                //       offset: Offset(0, 4))
                // ],
                color: Colors.white),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                getSpace(h: 25.h),
                getText('${currentPackag.name}',
                    color: grayTextColor, size: 13.sp, align: TextAlign.center),
                getSpace(h: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                      visible:currentPackag.discounts!.isNotEmpty,
                      child: getText("${currentPackag.price} ريال ",
                          color: grayTextColor1,
                          size: 15.sp,
                          align: TextAlign.center,
                          decoration: TextDecoration.lineThrough),
                    ),
                    getSpace(w: 10.w),
                    getText("${priceAfterDiscount ?? currentPackag.price} ريال",
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
                if (GetStorage().read("token") != null) {
                  SubscrbtionGetxController.to.package = currentPackag;
                  //print(SubscrbtionGetxController.to.package);
                  Get.to(() => Subscrbtions(),
                      transition: Transition.downToUp,
                      duration: const Duration(milliseconds: 300));
                } else {
                  Get.offAll(() => const LoginScreen(),
                      transition: Transition.downToUp,
                      duration: const Duration(milliseconds: 300));
                }
              },
              child: Container(
                width: 85.w,
                height: 38.h,
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12.r),
                        topRight: Radius.circular(12.r)),
                    color: controller.subBackColor.value),
                child: getText('sub'.tr,
                    color: controller.subTextColor.value,
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
                showDitailsDialog(context,currentPackag);
              },
              child: SizedBox(
                width: 85.w,
                height: 35.h,
                child: getText('details'.tr,
                    color: sucndryColor1, size: 14.sp, align: TextAlign.center),
              ),
            ),
          )
        ],
      );
    });
  }
}


