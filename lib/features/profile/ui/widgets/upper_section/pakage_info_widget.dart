import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/app_widget.dart';

class PakageInfoWidget extends StatelessWidget {
  const PakageInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(16.0.r),
      child: IntrinsicHeight(
        child: Row(
          children: [
            getText('الباقة الخاصة',size: 14.sp,color: mainColor),
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
                  TextSpan(text: ' 10/10/2024 '),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
