import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:naz_gem/features/bill/ui/widget/myBillWidgets/sub_item_widget1.dart';
import 'package:naz_gem/features/bill/ui/widget/myBillWidgets/sub_item_widget2.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../domain/entities/bill.dart';
import '../../get/bill_getx_controller.dart';
import '../../pages/bill_details.dart';

class MyItemWidget extends StatelessWidget {
  final Bill bill;

  const MyItemWidget({super.key, required this.bill});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print(bill);
        BillGetXController.to.bill = bill;
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
              ItemOneWidget(id: '${bill.userIdNumber}', month: 'اشتراك  ${bill.subscription?.totalDays}  يوم'),
              ItemTwoWidget(bill: bill),
            ],
          )),
    );
  }
}
