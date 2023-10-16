import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:naz_gem/core/constants/utils.dart';
import 'package:naz_gem/features/notifications/ui/get/notification_getx_controller.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/app_widget.dart';
import '../widget/notification_item.dart';

class NotificationPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:  getAppBar(
          text: 'notification'.tr,
          isBack: true,
          height: 60.h
      ),
      body:  GetX<NotificationGetxController>(
          builder: (controller) {
            return controller.notifications.isEmpty?
            Center(child: buildCenterNoData("لا يوجد اشعارات "),)
                : ListView.builder(
              itemCount: controller.notifications.length,
              padding: EdgeInsets.all(16.r),
              itemBuilder: (context, index) {
                return NotificationItemWidget(
                  text: 'تمتعي بخصم 20% على جميع الباقات المتاحة',
                  title: 'خصومات على الاشتراك',
                );
              },);
          }
      ),


    );
  }
}


