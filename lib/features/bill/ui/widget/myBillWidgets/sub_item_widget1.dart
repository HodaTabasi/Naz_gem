
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/app_widget.dart';

class ItemOneWidget extends StatelessWidget {
 final String month;
 final String id;
  const ItemOneWidget({
    super.key,
    required this.month,
    required this.id
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        getText(
          month,
          color: blackTextColor,
          size: 16.sp,
        ),
        getSpace(h: 8.h),
        Text.rich(
          TextSpan(
            style: TextStyle(
                color: Colors.grey.shade500, fontSize: 12.sp),
            children: [
              TextSpan(text: 'id_number'.tr),
              TextSpan(text: id),
            ],
          ),
        )
      ],
    );
  }
}
