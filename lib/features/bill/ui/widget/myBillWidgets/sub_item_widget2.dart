import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/app_widget.dart';
import '../../../domain/entities/bill.dart';
import 'ButtonWidget.dart';

class ItemTwoWidget extends StatelessWidget {
  const ItemTwoWidget({
    super.key,
    required this.bill,
  });

  final Bill bill;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Visibility(
          visible: bill.subscription?.status == "active",
          child: ButtonWidget(
            size: Size(110.w, 20.h),
            text: 'connect_now'.tr,
            color: mainColor,
            onPress: () {},
          ),
        ),
        Visibility(
          visible: bill.subscription?.status != "active",
          child: ButtonWidget(
            size: Size(75.w, 20.h),
            text: bill.subscription?.status == "pending"
                ? 'pending'.tr
                : bill.subscription?.status == "paused"
                    ? 'paused'.tr
                    : 'expire'.tr,
            color: boarderColor,
            onPress: () {},
          ),
        ),
        getSpace(h: 8.h),
        Text.rich(
          TextSpan(
            style: TextStyle(color: Colors.grey.shade500, fontSize: 12.sp),
            children: [
              TextSpan(text: 'date'.tr),
              TextSpan(text: '${bill.subscription?.startDate}'),
            ],
          ),
        )
      ],
    );
  }
}
