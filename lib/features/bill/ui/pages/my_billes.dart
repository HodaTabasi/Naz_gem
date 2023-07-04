import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:naz_gem/core/constants/app_widget.dart';

import '../../../../core/constants/app_colors.dart';
import 'bill_details.dart';

class MyBilles extends StatefulWidget {
  @override
  State<MyBilles> createState() => _MyBillesState();
}

class _MyBillesState extends State<MyBilles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80.h,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text("sure_sub".tr,
            style: TextStyle(color: blackTextColor, fontSize: 20.sp)),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 3,
        padding: EdgeInsets.all(16.r),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
              Get.to(()=>BillDetails());
            },
            child: Container(
                height: 110.h,
                margin: EdgeInsets.symmetric(vertical: 5.h),
                padding: EdgeInsets.symmetric(horizontal: 8.r),
                decoration: BoxDecoration(
                    color: grayBackground,
                    borderRadius: BorderRadius.circular(10.r)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'اشتراك شهر واحد',
                          style: TextStyle(
                            color: blackTextColor,
                            fontSize: 16.sp,
                          ),
                        ),
                        getSpace(h:8.h),
                        Text.rich(
                          TextSpan(
                            style: TextStyle(
                                color: Colors.grey.shade500, fontSize: 12.sp),
                            children: [
                              TextSpan(text: 'id_number'.tr),
                              TextSpan(text: '13242424'),
                            ],
                          ),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Visibility(
                          visible: index == 0,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                  fixedSize: Size(110.w, 20.h),
                                  // textStyle: TextStyle(
                                  //     fontSize: 12.sp,
                                  //     color: blackTextColor,
                                  //     fontFamily: 'br'),
                                  backgroundColor: mainColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.r))),
                              onPressed: () {},
                              child: Text('connect_now'.tr,style: TextStyle(
                                  fontSize: 12.sp,
                                  color: blackTextColor,
                                  fontFamily: 'br'),)),
                        ),
                        Visibility(
                          visible: index != 0,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                  fixedSize: Size(65.w, 20.h),
                                  // textStyle: TextStyle(
                                  //     fontSize: 12.sp,
                                  //     color: blackTextColor,
                                  //     fontFamily: 'br'),
                                  backgroundColor: boarderColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.r))),
                              onPressed: () {},
                              child: Text('expire'.tr,style: TextStyle(
                                  fontSize: 12.sp,
                                  color: blackTextColor,
                                  fontFamily: 'br'),)),
                        ),
                        getSpace(h:8.h),
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
                    ),
                  ],
                )),
          );
        },
      ),
    );
  }
}
