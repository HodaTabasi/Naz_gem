import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:naz_gem/core/constants/app_colors.dart';
import 'package:naz_gem/features/bill/ui/widget/widget_const.dart';

import '../../../../core/widgets/app_widget.dart';
import '../widget/billDetailsWidgets/BlockOneColumnWidget.dart';
import '../widget/billDetailsWidgets/RowWidget.dart';

class BillDetails extends StatefulWidget {
  @override
  State<BillDetails> createState() => _BillDetailsState();
}

class _BillDetailsState extends State<BillDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: getAppBar(
        text: "bill_details".tr,
        isBack: true,
        height: 80.h
      ),
      body: ListView(
        padding: EdgeInsets.all(16.r),
        children: [
          Container(
            margin: margin,
            padding: padding,
            decoration: decoration,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BlockOneColumnWidget(
                  title1: 'bill_number'.tr,
                  text1: '123456',
                  title2: 'id_number'.tr,
                  text2: '123456',
                ),
                Spacer(),
                BlockOneColumnWidget(
                  title1: 'bill_date'.tr,
                  text1: '123456',
                  title2: 'bill_d_num'.tr,
                  text2: '123456',
                ),
                Spacer()
              ],
            ),
          ),
          getSpace(h: 16.r),
          Container(
            margin: margin,
            padding: padding,
            decoration: decoration,
            child: Text.rich(
              TextSpan(
                style: TextStyle(color: blackTextColor, fontSize: 16.sp),
                children: [
                  TextSpan(text: 'sub_type'.tr),
                  TextSpan(text: ' شهر واحد  '),
                ],
              ),
            ),
          ),
          getSpace(h: 16.r),
          Container(
              margin:margin,
              padding: padding,
              decoration: decoration,
              child: Column(
                children: [
                  RowWidget(
                    text: '1200 ريال',
                    title: 'price'.tr,
                  ),
                  getSpace(h: 10.h),
                  RowWidget(
                    text: '0 ريال',
                    title: 'descount'.tr,
                  ),
                  getSpace(h: 10.h),
                  RowWidget(
                    text: '100 ريال',
                    title: 'tax'.tr,
                  ),
                  getSpace(h: 16.h),
                  getDivider(),
                  getSpace(h: 8.h),
                  RowWidget(
                    text: '100 ريال',
                    title: 'total'.tr,
                    flag: true,
                  ),
                  getSpace(h: 8.h),
                ],
              ))
        ],
      ),
    );
  }
}

