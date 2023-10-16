import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:naz_gem/features/contact_info/ui/widgets/contact_class.dart';
import 'package:naz_gem/features/home/domain/entities/packages.dart';
import 'package:naz_gem/features/home/ui/get/home_getx_controller.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/utils.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_widget.dart';
import '../../../auth/ui/pages/login.dart';
import '../../../notifications/ui/pages/notificaion_page.dart';
import '../../../subscrbtions/ui/get/subscrbtions_getx_controller.dart';
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
            Get.to(() => NotificationPage(),
                transition: Transition.downToUp,
                duration: const Duration(milliseconds: 500));
          }, //
          child: Center(
            child: Stack(
              children: [
                SvgPicture.asset("assets/images/notification.svg", width: 19.w),
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

void showDitailsDialog(BuildContext context, Package currentPackag) {
  var priceAfterDiscount = getDiscount(currentPackag);
  final details = json.decode(currentPackag.details!);

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
                            getText('${HomeGetxController.to.getName(currentPackag)}',
                                color: Colors.white, size: 16.sp),
                            getSpace(h: 10.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Visibility(
                                  visible: currentPackag.discounts!.isNotEmpty,
                                  child: getText("${currentPackag.price} ريال",
                                      color: grayTextColor1,
                                      size: 15.sp,
                                      align: TextAlign.center,
                                      decoration: TextDecoration.lineThrough),
                                ),
                                getSpace(w: 10.w),
                                getText(
                                    "${priceAfterDiscount ?? currentPackag.price} ريال",
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
                  Visibility(
                    visible: currentPackag.discounts!.isNotEmpty,
                    child: getText(
                        '${currentPackag.discounts!.isNotEmpty ? currentPackag.discounts!.first.name : ''}',
                        size: 20.sp,
                        color: blackTextColor),
                  ),
                  // getSpace(h: 8.h),
                  Visibility(
                    visible: currentPackag.discounts!.isNotEmpty,
                    child: SizedBox(
                      height: 72.h,
                      child: Stack(
                        children: [
                          SvgPicture.asset('assets/images/sale1.svg'),
                          PositionedDirectional(
                            top: 30.h,
                            start: 0,
                            end: 0,
                            child: getText(
                                '${currentPackag.discounts!.isNotEmpty ? currentPackag.discounts!.first.ratio : ''}%',
                                size: 20.sp,
                                color: Colors.black,
                                align: TextAlign.center),
                          ),
                        ],
                      ),
                    ),
                  ),
                  getSpace(h: 8.h),
                  getText('تفاصيل الباقة',
                      size: 16.sp,
                      color: blackTextColor,
                      align: TextAlign.center),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: details.length,
                    itemBuilder: (context, index) {
                      return Container(
                        color: Colors.white,
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.r, vertical: 10.r),
                        child: Row(
                          children: [
                            SvgPicture.asset('assets/images/gem1.svg'),
                            getSpace(w: 10.w),
                            getText('${details[index]['value']}',
                                size: 14.sp, color: blackTextColor,maxLines: 5),
                          ],
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0.r, vertical: 0.r),
                    child: BtnApp(
                      title: 'sub'.tr,
                      prsee: () {
                        if (GetStorage().read("token") != null) {
                          SubscrbtionGetxController.to.package = currentPackag;
                          Get.to(() => Subscrbtions(),
                              transition: Transition.downToUp,
                              duration: const Duration(milliseconds: 300));
                        } else {
                          Get.offAll(() => const LoginScreen(),
                              transition: Transition.downToUp,
                              duration: const Duration(milliseconds: 300));
                        }
                      },
                      color: btnColor,
                      textColor: Colors.white,
                    ),
                  ),
                  // getSpace(h: 8.h),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: getText('cancel'.tr, size: 14.sp, color: btnColor),
                  ),
                  getSpace(h: 12.h),
                ],
              ),
            )),
      );
    },
  );
}

SizedBox buildSlider(HomeGetxController controller) {
  return SizedBox(
    height: 230.h,
    child: controller.sliders.isEmpty
        ? Padding(
      padding: const EdgeInsets.all(16.0),
      child: buildCenterNoData('لا يوجد اعلانات متاحة'),
    )
        :ListView.builder(
      itemCount: controller.sliders.length,
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
              image: DecorationImage(
                image: NetworkImage(controller.sliders[index].image!),
              )),
          child: Stack(
            children: [
              PositionedDirectional(
                top: 35.h,
                start: 25.w,
                child: getText(controller.sliders[index].title!,
                    color: Colors.white, size: 20.sp, weight: FontWeight.bold),
              ),
              PositionedDirectional(
                top: 80.h,
                start: 25.w,
                child: getText(
                  controller.sliders[index].description ?? '',
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
                            borderRadius: BorderRadius.circular(8.r))),
                    onPressed: () {
                      launch(
                          Uri.parse(controller.sliders[index].url??''), context);
                    },
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

Future<dynamic> buildImageDialog(BuildContext context, url) {
  return showDialog(
    context: context,
    builder: (context) {
      return Container(
        color: Colors.black.withOpacity(0.6),
        child: SizedBox(
          width: MediaQuery.of(context).size.width - 50.w,
          // height: MediaQuery.of(context).size.height- 200.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.5)
                ),
                child: Padding(
                  padding:  EdgeInsets.all(5.0.r),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.clear,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0.r,vertical: 5.r),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: mainColor, width: 0.5),
                    ),
                    child: Image.network(url,
                        fit: BoxFit.fill,
                        height: MediaQuery.of(context).size.height - 250.h),
                  ),
                ),
              ),

            ],
          ),
        ),
      );
    },
  );
}
/*
 SizedBox(
          width: MediaQuery.of(context).size.width - 20.w,
          // height: MediaQuery.of(context).size.height- 200.h,
          child: Stack(
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  // color: Colors.white,
                  borderRadius: BorderRadius.circular(15.r),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5,
                        blurStyle: BlurStyle.normal,
                        // spreadRadius: 5,
                      )
                    ]),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: mainColor, width: 0.5),
                    ),
                    child: Image.network(url,
                        fit: BoxFit.fill,
                        height: MediaQuery.of(context).size.height - 250.h),
                  ),
                ),
              ),
              PositionedDirectional(
                end: 5,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.clear,
                      color: Colors.red,
                    ),
                  )),
            ],
          ),
        ),
* */