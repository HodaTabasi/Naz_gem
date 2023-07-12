import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/app_widget.dart';
import 'ContactInfoItemWidget.dart';
import 'ScoialMediaItemWidget.dart';
import 'WorkTimeWidget.dart';
import 'contact_class.dart';

class ContactLowerSctionsWidget extends StatelessWidget {
  const ContactLowerSctionsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      height: MediaQuery.of(context).size.height - 210.h,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.r),
              topLeft: Radius.circular(20.r))),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            getSpace(
                h: 16.h
            ),
            getText(
              'contact_info'.tr,
              size: 18.sp,
              color: blackTextColor,
            ),
            GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(vertical: 16.h),
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: buildSliverGridDelegateWithFixedCrossAxisCount(),
              itemCount: infoData.length,
              itemBuilder: (context, index) {
                return ContactInfoItemWidget(index:index);
              },
            ),
            getSpace(h: 16.h),
            getText(
              'work_time'.tr,
              size: 18.sp,
              color: blackTextColor,
            ),
            getSpace(h: 16.h),
            const WorkTimeWidget(),
            getSpace(h: 16.h),
            const ScoialMediaItemWidget()
          ],
        ),
      ),
    );
  }


}



