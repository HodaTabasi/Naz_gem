import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:naz_gem/core/constants/app_widget.dart';

import '../../../../core/constants/app_colors.dart';
import '../widget/horizontal_week_calendar.dart';

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
      appBar: AppBar(
        toolbarHeight: 60.h,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text("my_booking".tr,
            style: TextStyle(color: blackTextColor, fontSize: 20.sp)),
        centerTitle: true,
        automaticallyImplyLeading: false,
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
          ListView.builder(
            itemCount: 2,
            shrinkWrap: true,
            padding: EdgeInsets.all(8.r),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                width: MediaQuery.of(context).size.width,
                height: 110.h,
                margin: EdgeInsets.symmetric(vertical: 5.r),
                decoration: BoxDecoration(
                    color: itemBackgroundColor,
                    borderRadius: BorderRadius.circular(10.r)),
                child: Stack(
                  children: [
                    Container(
                      width: 10,
                      // height: ,
                      decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10.r),
                              bottomRight: Radius.circular(10.r))),
                    ),
                    PositionedDirectional(
                        end: 30.w,
                        bottom: 20.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(text: 'زومبا -'),
                                  TextSpan(
                                      text: ' ك. أوكسانا',
                                      style: TextStyle(color: goldenColor)),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Text.rich(
                                  TextSpan(
                                    style:
                                        TextStyle(color: Colors.grey.shade500),
                                    children: [
                                      WidgetSpan(
                                          child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4.0),
                                        child: Icon(Icons.timer_outlined,
                                            color: Colors.grey, size: 15.r),
                                      )),
                                      TextSpan(text: ' 5-6 مسائًا'),
                                    ],
                                  ),
                                ),
                                getSpace(w: 8.h),
                                Visibility(
                                  visible: flag,
                                  child: Text.rich(
                                    TextSpan(
                                      style: TextStyle(
                                          color: Colors.grey.shade500),
                                      children: [
                                        WidgetSpan(
                                            child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 4.0),
                                          child: Icon(Icons.person_outline,
                                              color: Colors.grey, size: 16.r),
                                        )),
                                        TextSpan(text: ' تدريب فردي '),
                                      ],
                                    ),
                                  ),
                                ),
                                getSpace(w: 16.h),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        fixedSize: Size(95.w, 35.h),
                                        textStyle: TextStyle(
                                            fontSize: 12.sp,
                                            color: Colors.white,
                                            fontFamily: 'br'),
                                        backgroundColor: Colors.red.shade600,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.r))),
                                    onPressed: () {},
                                    child: Text('cancel_booking'.tr))
                              ],
                            )
                          ],
                        )),
                  ],
                ),
              );
            },
          ),
          getSpace(h: 8.h),
          Padding(
            padding: EdgeInsets.all(8.0.r),
            child: Text("avilable_booking".tr,
                style: TextStyle(color: blackTextColor, fontSize: 16.sp)),
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
                print("xgdfgdf");
              });
            },
          ),
          getSpace(h: 8.h),
          ListView.builder(
            itemCount: 2,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.all(8.r),
            itemBuilder: (context, index) {
              return Container(
                width: MediaQuery.of(context).size.width,
                height: 220.h,
                margin: EdgeInsets.symmetric(vertical: 5.r),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    image: const DecorationImage(
                        image: AssetImage('assets/images/card_background.png'),
                        fit: BoxFit.cover)),
                child: Stack(
                  children: [
                    PositionedDirectional(
                        child: Padding(
                          padding:  EdgeInsets.all(16.0.r),
                          child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          getSpace(h:8.r),
                          Row(
                            children: [
                               CircleAvatar(
                                    radius: 20.r,
                                    backgroundColor: Color(0xffF5F5F5),
                                    child: SvgPicture.asset('assets/images/ll.svg'),
                                  ),
                              getSpace(w: 8.r),
                              Text.rich(
                                TextSpan(
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.sp
                                  ),
                                  children: [
                                    const TextSpan(text: 'زومبا -'),
                                    TextSpan(
                                        text: ' ك. أوكسانا',
                                        style: TextStyle(color: goldenColor)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          getSpace(h:16.r),
                          Text.rich(
                            TextSpan(
                              style: TextStyle(
                                  color: grayTextColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.sp),
                              children: [
                                WidgetSpan(child: getSpace(w: 5.r)),
                                WidgetSpan(
                                    child: Icon(
                                  Icons.timer_outlined,
                                  color: mainColor,
                                )),
                                WidgetSpan(child: getSpace(w: 10.r)),
                                TextSpan(text: ' 5-6 مسائًا'),
                              ],
                            ),
                          ),
                          getSpace(h: 8.r),
                          Text.rich(
                            TextSpan(
                              style: TextStyle(
                                  color: grayTextColor,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold),
                              children: [
                                WidgetSpan(child: getSpace(w: 5.r)),
                                WidgetSpan(
                                    child: Icon(
                                  Icons.person_outline,
                                  color: mainColor,
                                )),
                                WidgetSpan(child: getSpace(w: 10.r)),
                                TextSpan(text: ' تدريب فردي '),
                              ],
                            ),
                          ),
                      ],
                    ),
                        )),
                    PositionedDirectional(
                      start: 0,
                      end: 0,
                      bottom: 0,
                      child: Container(
                        height: 50.h,
                        decoration: BoxDecoration(
                            color: mainColor,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10.r),
                                bottomRight: Radius.circular(10.r))),
                        child: Padding(
                          padding: EdgeInsets.only(top: 8.0.r),
                          child: Text(
                            'book_now'.tr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: blackTextColor, fontSize: 16.sp),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
