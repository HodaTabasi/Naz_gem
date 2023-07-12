import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:naz_gem/core/constants/utils.dart';

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
      body: ListView.builder(
        itemCount: Utils.data.length,
          padding: EdgeInsets.all(16.r),
          itemBuilder: (context, index) {
            return NotificationItemWidget(
              text: 'تمتعي بخصم 20% على جميع الباقات المتاحة',
              title: 'خصومات على الاشتراك',
            );
          },),
    );
  }
}


