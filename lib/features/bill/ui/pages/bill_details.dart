import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:naz_gem/core/constants/app_colors.dart';

import '../../../../core/constants/app_widget.dart';

class BillDetails extends StatefulWidget {
  @override
  State<BillDetails> createState() => _BillDetailsState();
}

class _BillDetailsState extends State<BillDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80.h,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text("bill_details".tr,
            style: TextStyle(color: blackTextColor, fontSize: 20.sp)),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back, color: Colors.black)),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.r),
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 5.h),
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
                color: grayBackground,
                borderRadius: BorderRadius.circular(10.r)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'bill_number'.tr,
                      style: TextStyle(
                        color: grayTextColor,
                        fontSize: 12.sp,
                      ),
                    ),
                    Text(
                      '1245336',
                      style: TextStyle(
                        color: blackTextColor,
                        fontSize: 16.sp,
                      ),
                    ),
                    getSpace(h: 16.h),
                    Text(
                      'id_number'.tr,
                      style: TextStyle(
                        color: grayTextColor,
                        fontSize: 13.sp,
                      ),
                    ),
                    Text(
                      '1245336',
                      style: TextStyle(
                        color: blackTextColor,
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'bill_date'.tr,
                      style: TextStyle(
                        color: grayTextColor,
                        fontSize: 12.sp,
                      ),
                    ),
                    Text(
                      '1245336',
                      style: TextStyle(
                        color: blackTextColor,
                        fontSize: 16.sp,
                      ),
                    ),
                    getSpace(h: 16.h),
                    Text(
                      'bill_d_num'.tr,
                      style: TextStyle(
                        color: grayTextColor,
                        fontSize: 13.sp,
                      ),
                    ),
                    Text(
                      '1245336',
                      style: TextStyle(
                        color: blackTextColor,
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
                Spacer()
              ],
            ),
          ),
          getSpace(h: 16.r),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5.h),
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
                color: grayBackground,
                borderRadius: BorderRadius.circular(10.r)),
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
              margin: EdgeInsets.symmetric(vertical: 5.h),
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                  color: grayBackground,
                  borderRadius: BorderRadius.circular(10.r)),
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
                  Divider(
                    color: Color(0xffD3D3D3),
                    thickness: 1,
                  ),
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

class RowWidget extends StatelessWidget {
  final String title;
  final String text;
  final bool flag;

  const RowWidget({super.key, required this.title, required this.text ,this.flag = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: flag?Color(0xffC71B1A):blackTextColor,
            fontSize: 14.sp,
            fontWeight: flag?FontWeight.bold:null
          ),
        ),
        Text(
          text,
          style: TextStyle(
            color: blackTextColor,
            fontSize: 14.sp,
          ),
        ),
      ],
    );
  }
}
