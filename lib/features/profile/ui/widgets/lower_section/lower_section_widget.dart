import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:naz_gem/features/profile/ui/get/edit_profile_getx_controller.dart';
import 'package:naz_gem/features/profile/ui/widgets/lower_section/profile_item_widget.dart';
import 'package:naz_gem/features/profile/ui/widgets/lower_section/profile_item_widget_date.dart';

import '../../../../../core/widgets/app_widget.dart';

class LowerSectionWidget extends StatelessWidget {
  const LowerSectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProfileGetxController>(builder: (controller) {
      return Container(
        padding: EdgeInsets.all(16.r),
        height: MediaQuery.of(context).size.height - 340.h,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.r),
                topLeft: Radius.circular(20.r))),
        child: Column(
          children: [
            getSpace(h: 16.h),
            ProfileItemWidget(
                text: controller.myUser.phone,
                icon: 'assets/images/phonee.svg'),
            ProfileItemWidget(
                text: controller.myUser.email,
                icon: 'assets/images/emaile.svg'),
            ProfileItemWidgetDate(
                text: controller.myUser.birthdate ?? 'dD/MM/YYYY',
                icon: 'assets/images/birth.svg'),
            ProfileItemWidget(
                text: '${controller.myUser.length == "null" ?'':controller.myUser.length} سم ',
                icon: 'assets/images/hh.svg'),
            ProfileItemWidget(
                text: controller.myUser.bloodType ?? '',
                icon: 'assets/images/bload.svg'),
          ],
        ),
      );
    });
  }
}
