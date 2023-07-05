import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/app_widget.dart';
import 'ButtonWidget.dart';

class ItemTwoWidget extends StatelessWidget {
  const ItemTwoWidget({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Visibility(
          visible: index == 0,
          child:  ButtonWidget(
            size: Size(110.w, 20.h),
            text: 'connect_now'.tr,
            color: mainColor,
            onPress: () {},
          ),
        ),
        Visibility(
          visible: index != 0,
          child: ButtonWidget(
            size: Size(65.w, 20.h),
            text: 'expire'.tr,
            color: boarderColor,
            onPress: () {},
          ),
        ),
        getSpace(h: 8.h),
        Text.rich(
          TextSpan(
            style: TextStyle(
                color: Colors.grey.shade500, fontSize: 12.sp),
            children: [
              TextSpan(text: 'date'.tr),
              TextSpan(text: '30.05.2023'),
            ],
          ),
        )
      ],
    );
  }
}

