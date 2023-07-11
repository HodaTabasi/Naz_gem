import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_widget.dart';
import '../../../notifications/ui/pages/notificaion_page.dart';
import '../../../subscrbtions/ui/pages/subscrbtion_screen.dart';
import 'custom_paint.dart';

AppBar buildAppBar() {
  return AppBar(
    toolbarHeight: 80.h,
    elevation: 0,
    backgroundColor: Colors.white,
    title: getText(
      'title'.tr,
      color: blackTextColor,
      size: 20.sp,
    ),
    centerTitle: true,
    actions: [
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: InkWell(
          onTap: () {
            Get.to(() => NotificationPage());
          }, //
          child: Center(
            child: Stack(
              children: [
                SvgPicture.asset("assets/images/notification.svg",
                    width: 19.w),
                PositionedDirectional(
                    child: CircleAvatar(
                      radius: 4,
                      backgroundColor: mainColor,
                    ))
              ],
            ),
          ),
        ),
      )
    ],
    leading: Image.asset("assets/images/logo_mine.png"),
  );
}

void showDitailsDialog(BuildContext context) {
  var w = MediaQuery.of(context).size.width;
  showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: Container(
            width: 350.w,
            // width: MediaQuery.of(context).size.width-100,
            // padding:
            // EdgeInsets.only(left: 16, right: 16, bottom: 16),
            // margin: EdgeInsets.only(top: 45),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              // boxShadow: [
              //   BoxShadow(
              //       color: Colors.black, offset: Offset(0, 10), blurRadius: 5),
              // ]
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    children: [
                      CustomPaint(
                        size: Size(
                            350.w, (350.w * 0.46938775510204084).toDouble()),
                        //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                        painter: RPSCustomPainter(),
                      ),
                      PositionedDirectional(
                        top: 20.h,
                        end: 0,
                        start: 0,
                        child: Column(
                          children: [
                            getText('3 شهور', color: Colors.white, size: 16.sp),
                            getSpace(h: 10.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                getText("2000 ريال",
                                    color: grayTextColor1,
                                    size: 15.sp,
                                    align: TextAlign.center,
                                    decoration: TextDecoration.lineThrough),
                                getSpace(w: 10.w),
                                getText("1200 ريال",
                                    color: Colors.white,
                                    size: 20.sp,
                                    weight: FontWeight.bold,
                                    align: TextAlign.center),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  // getSpace(h: 8.h),
                  getText('خصم يوم التأسيس',
                      size: 20.sp, color: blackTextColor),
                  // getSpace(h: 8.h),
                  SizedBox(
                    height: 72.h,
                    child: Stack(
                      children: [
                        SvgPicture.asset('assets/images/sale1.svg'),
                        PositionedDirectional(
                          top: 30.h,
                          start: 0,
                          end: 0,
                          child: getText('20%',
                              size: 20.sp, color: Colors.black,align: TextAlign.center),
                        ),
                      ],
                    ),
                  ),
                  getSpace(h: 8.h),
                  getText('تفاصيل الباقة',
                      size: 16.sp, color: blackTextColor,align: TextAlign.center),
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 16.r,vertical: 12.r),
                    child: Row(
                      children: [
                         SvgPicture.asset('assets/images/gem1.svg'),
                         getSpace(w:10.w),
                         getText('الحجوزات المسموح بها جلستين',
                            size: 14.sp, color: blackTextColor) ,
                      ],

                    ),
                  ),
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 16.r,vertical: 12.r),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/images/gem1.svg'),
                        getSpace(w:10.w),
                        getText('مدربين معتمدين',
                            size: 14.sp, color: blackTextColor) ,
                      ],

                    ),
                  ),
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 16.r,vertical: 12.r),
                    child: Row(
                      children: [
                       SvgPicture.asset('assets/images/gem1.svg'),
                        getSpace(w:10.w),
                       getText('أجهزة حديثة متطورة',
                            size: 14.sp, color: blackTextColor) ,
                      ],

                    ),
                  ),
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 16.r,vertical: 12.r),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/images/gem1.svg'),
                        getSpace(w:10.w),
                        getText('الحجوزات المسموح بها جلستين',
                            size: 14.sp, color: blackTextColor) ,
                      ],

                    ),
                  ),
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 16.r,vertical: 12.r),
                    child: Row(
                      children: [
                         SvgPicture.asset('assets/images/gem1.svg'),
                        getSpace(w:10.w),
                         getText('استشارات في اللياقة والرياضة',
                            size: 14.sp, color: blackTextColor) ,
                      ],

                    ),
                  ),
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 16.r,vertical: 12.r),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/images/gem1.svg'),
                        getSpace(w:10.w),
                        getText('امكانية استخدام جميع المرافق',
                            size: 14.sp, color: blackTextColor) ,
                      ],

                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0.r),
                    child: BtnApp(title: 'sub'.tr, prsee: (){
                      Get.to(()=>Subscrbtions());
                    }, color: btnColor,textColor: Colors.white,),
                  ),
                  // getSpace(h: 8.h),
                  TextButton(
                    onPressed: (){
                      Get.back();
                    },
                    child: getText('cancel'.tr,
                        size: 14.sp, color:btnColor ),
                  ),
                  // getSpace(h: 8.h),
                ],

              ),
            )),
      );
    },
  );
}

SizedBox buildSlider() {
  return SizedBox(
    height: 230.h,
    child: ListView.builder(
      itemCount: 3,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      padding: EdgeInsets.all(8.r),
      itemBuilder: (context, index) {
        return Container(
          width: 340.w,
          height: 200.h,
          margin: EdgeInsets.symmetric(horizontal: 4.r),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              image: const DecorationImage(
                image:
                AssetImage('assets/images/slider_background.png'),
              )),
          child: Stack(
            children: [
              PositionedDirectional(
                top: 35.h,
                start: 25.w,
                child: getText("نادي ناز للسيدات",
                    color: Colors.white,
                    size: 20.sp,
                    weight: FontWeight.bold),
              ),
              PositionedDirectional(
                top: 80.h,
                start: 25.w,
                child: getText(
                  "جيم نسائي ومركز لياقة بدنية",
                  color: mainColor,
                  size: 18.sp,
                ),
              ),
              PositionedDirectional(
                bottom: 30.h,
                start: 25.w,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: mainColor,
                        fixedSize: Size(120.w, 40.h),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(8.r))),
                    onPressed: () {},
                    child: getText(
                      'join'.tr,
                      color: blackTextColor,
                      size: 16.sp,
                    )),
              )
            ],
          ),
        );
      },
    ),
  );
}

SliverGridDelegateWithFixedCrossAxisCount buildSliverGridDelegate() {
  return SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 16.w,
      mainAxisSpacing: 16.h,
      childAspectRatio: 3 / 2.5);
}