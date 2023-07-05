import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:naz_gem/core/widgets/app_widget.dart';

import '../../../../core/constants/app_colors.dart';
import '../widget/horizontal_week_calendar.dart';
import '../widget/item_one.dart';
import '../widget/item_two.dart';
import '../widget/list_item_widget.dart';

class BookingScreen extends StatefulWidget {
  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  var flag = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:  getAppBar(
          text: 'my_booking'.tr,
          isBack: false,
          height: 60.h
      ),
      body: ListView(
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
                var selectedDate = date;
                print("xgdfgdf");
              });
            },
          ),
          getSpace(h: 8.h),
          ListViewWidget(
              item: ItemOneWidget(
            flag: flag,
            backgroundColor: mainColor,
          )),
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
                var selectedDate = date;
              });
            },
          ),
          getSpace(h: 8.h),
          ListViewWidget(
              item: ItemTwoWidget(
            image: 'assets/images/card_background.png',
            backgroundColor: mainColor,
          )),
        ],
      ),
    );
  }
}
