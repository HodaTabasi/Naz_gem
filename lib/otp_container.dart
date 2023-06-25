import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'core/app_colors.dart';
import 'core/app_widget.dart';
import 'otp_form.dart';

class OtpContainer extends StatelessWidget {
  const OtpContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'enter_code'.tr,
          style: TextStyle(fontSize: 14.sp, color: blackTextColor,fontFamily: 'tajawal'),
          textAlign: TextAlign.center,
        ),
        OtpForm(),
        getSpace(h: 10.0.r),
        RichText(
          text: TextSpan(
            text: 'code1'.tr,
            style: TextStyle(
                color: blackTextColor,
                fontWeight: FontWeight.normal,
                fontFamily: 'tajawal',
                fontSize: 16.sp),
            children: <TextSpan>[
              TextSpan(
                  text: 'code2'.tr,
                  style: TextStyle(
                      color: sucndryColor, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ],
    );
  }
}
