import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/app_widget.dart';
import '../../get/edit_profile_getx_controller.dart';

class PakageInfoWidget extends StatelessWidget {
  const PakageInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProfileGetxController>(
      builder: (controller) {
        return controller.myUser.activeSubscription?.packageType == null ? const SizedBox():  Padding(
          padding:  EdgeInsets.all(16.0.r),
          child: IntrinsicHeight(
            child: Row(
              children: [
                getText('${controller.myUser.activeSubscription?.packageType}',size: 14.sp,color: mainColor),
                 Padding(
                  padding:  EdgeInsets.all(5.0.r),
                  child: VerticalDivider(
                    color: Colors.white,
                    thickness: 2.r,
                  ),
                ),
                Text.rich(
                  TextSpan(
                    style: TextStyle(
                        color: mainColor,
                        fontWeight: FontWeight.normal,
                        fontSize: 14.sp),
                    children: [
                      TextSpan(text: 'expire_date'.tr),
                      if(controller.myUser.activeSubscription?.packageType == "public")
                      TextSpan(text: ' ${controller.myUser.activeSubscription?.endDate} '),
                      if(controller.myUser.activeSubscription?.packageType == "private")
                        TextSpan(text: ' ${controller.myUser.activeSubscription?.remainingSessions} '),

                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
