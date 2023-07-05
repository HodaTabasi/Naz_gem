import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:naz_gem/features/bill/ui/widget/myBillWidgets/sub_item_widget1.dart';
import 'package:naz_gem/features/bill/ui/widget/myBillWidgets/sub_item_widget2.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../pages/bill_details.dart';

class MyItemWidget extends StatelessWidget {
  final int index;

  const MyItemWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => BillDetails());
      },
      child: Container(
          height: 110.h,
          margin: EdgeInsets.symmetric(vertical: 5.h),
          padding: EdgeInsets.symmetric(horizontal: 8.r),
          decoration: BoxDecoration(
            color: grayBackground,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const ItemOneWidget(id: '123456', month: 'اشتراك شهر واحد'),
              ItemTwoWidget(index: index),
            ],
          )),
    );
  }
}
