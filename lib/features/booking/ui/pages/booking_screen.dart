import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:naz_gem/core/widgets/app_widget.dart';
import 'package:naz_gem/features/booking/ui/get/user_session_getx_controller.dart';

import '../../../../core/constants/app_colors.dart';
import '../get/avaibale_getx_controller.dart';
import '../widget/horizontal_week_calendar.dart';
import '../widget/item_one.dart';
import '../widget/item_two.dart';

class BookingScreen extends StatefulWidget {
  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  var flag = true;

  @override
  void initState() {
    AvailableGetxController.to.getAllAvailableSessions();
    UserSessionGetxController.to.getUserSessions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: getAppBar(text: 'my_booking'.tr, isBack: false, height: 60.h),
      body: Obx(() {
        return ListView(
          padding: EdgeInsets.all(8.r),
          children: [
            HorizontalWeekCalendar(
              // weekStartFrom: WeekStartFrom.Monday,
              activeBackgroundColor: mainColor,
              activeTextColor: blackTextColor,
              inactiveBackgroundColor: Colors.grey.withOpacity(.2),
              inactiveTextColor: Colors.grey,
              disabledTextColor: blackTextColor,
              disabledBackgroundColor: Colors.white.withOpacity(.3),
              activeNavigatorColor: Colors.white,
              inactiveNavigatorColor: Colors.grey,
              // monthColor: Colors.purple,
              onDateChange: (date) {
                setState(() {
                  UserSessionGetxController.to.currentDate.value =
                      DateFormat('yyyy-MM-dd').format(date);
                  print(UserSessionGetxController.to.currentDate.value);
                });
              },
            ),
            getSpace(h: 8.h),
            UserSessionGetxController.to.userSessionLoading.value
                ? buildSizedBoxLoading(context)
                : UserSessionGetxController
                .to
                .map[UserSessionGetxController.to.currentDate.value]!
                .isEmpty
                ? buildCenterNoData('لا يوجد مواعيد متاحة'):
            ListView.builder(
              itemCount: UserSessionGetxController
                  .to
                  .map[UserSessionGetxController.to.currentDate.value]!
                  .length,
              shrinkWrap: true,
              padding: EdgeInsets.all(8.r),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ItemOneWidget(
                  flag: flag,
                  backgroundColor: mainColor,
                  reservationSession: UserSessionGetxController.to.map[
                  UserSessionGetxController
                      .to.currentDate.value]![index],
                );
              },
            ),
            getSpace(h: 8.h),
            Padding(
              padding: EdgeInsets.all(8.0.r),
              child: getText(
                'avilable_booking'.tr,
                color: blackTextColor,
                size: 16.sp,
              ),
            ),
            HorizontalWeekCalendar(
              // weekStartFrom: WeekStartFrom.Monday,
              activeBackgroundColor: mainColor,
              activeTextColor: blackTextColor,
              inactiveBackgroundColor: Colors.grey.withOpacity(.2),
              inactiveTextColor: Colors.grey,
              disabledTextColor: blackTextColor,
              disabledBackgroundColor: Colors.white.withOpacity(.3),
              activeNavigatorColor: Colors.white,
              inactiveNavigatorColor: Colors.grey,
              // monthColor: Colors.purple,
              onDateChange: (date) {
                setState(() {
                  AvailableGetxController.to.currentDate.value =
                      DateFormat('yyyy-MM-dd').format(date);
                  print(AvailableGetxController.to.currentDate.value);
                });
              },
            ),
            getSpace(h: 8.h),
            AvailableGetxController.to.avilableSessionLoading.value
                ? buildSizedBoxLoading(context)
                : AvailableGetxController
                        .to
                        .map[AvailableGetxController.to.currentDate.value]!
                        .isEmpty
                    ? SizedBox(
                child: buildCenterNoData('لا يوجد مواعيد متاحة'))
                    : ListView.builder(
                        itemCount: AvailableGetxController
                            .to
                            .map[AvailableGetxController.to.currentDate.value]!
                            .length,
                        shrinkWrap: true,
                        padding: EdgeInsets.all(8.r),
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return ItemTwoWidget(
                            image: 'assets/images/card_background.png',
                            backgroundColor: mainColor,
                            session: AvailableGetxController.to.map[
                                AvailableGetxController
                                    .to.currentDate.value]![index],
                          );
                        },
                      )
          ],
        );
      }),
    );
  }

  buildSizedBoxLoading(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height/2.5.h,
      child: Transform.scale(
      scale: 0.2,
        child:  LoadingIndicator(
            indicatorType: Indicator.ballSpinFadeLoader,/// Required, The loading type of the widget
            colors:  [mainColor,btnColor],       /// Optional, The color collections
          /// Optional, the stroke backgroundColor
        ),
      ),
    );
  }
}
