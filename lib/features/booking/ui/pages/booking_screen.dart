import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
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
  late ScrollController scrollController;

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(_listener);
     AvailableGetxController.to.getAllAvailableSessions(
        date: AvailableGetxController.to.currentDate, page: 1);
    UserSessionGetxController.to.getUserSessions();
    super.initState();
  }
  @override
  void dispose() {
    AvailableGetxController.to.currentDate.value = DateFormat('yyyy-MM-dd').format(DateTime.now());
    UserSessionGetxController.to.currentDate.value = DateFormat('yyyy-MM-dd').format(DateTime.now());
    super.dispose();
  }

  void _listener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      AvailableGetxController.to.currentPage++;
      if (AvailableGetxController.to.currentPage <=
          AvailableGetxController.to.lastPage) {
        AvailableGetxController.to.getAllAvailableSessions(
            date: AvailableGetxController.to.currentDate,
            page: AvailableGetxController.to.currentPage);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: getAppBar(text: 'my_booking'.tr, isBack: false, height: 60.h),
      body: Obx(() {
        return RefreshIndicator(
          onRefresh:() async{
              AvailableGetxController.to.getAllAvailableSessions(
                  date: AvailableGetxController.to.currentDate, page: 1);
              UserSessionGetxController.to.getUserSessions();
          },
          child: ListView(
            padding: EdgeInsets.all(8.r),
            children: [
              HorizontalWeekCalendar(
                // weekStartFrom: WeekStartFrom.Monday,
                activeBackgroundColor:
                    GetStorage().read("package_typ") == 1 ? mainColor : btnColor,
                activeTextColor: GetStorage().read("package_typ") == 1
                    ? blackTextColor
                    : Colors.white,
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
                      ? buildCenterNoData('لا يوجد مواعيد متاحة')
                      : ListView.builder(
                          itemCount: UserSessionGetxController
                              .to
                              .map[UserSessionGetxController.to.currentDate.value]!.value
                              .length,
                          shrinkWrap: true,
                          padding: EdgeInsets.all(8.r),
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return ItemOneWidget(
                              flag: flag,
                              backgroundColor:
                                  GetStorage().read("package_typ") == 1
                                      ? mainColor
                                      : btnColor,
                              reservationSession:
                                  UserSessionGetxController.to.map[
                                      UserSessionGetxController
                                          .to.currentDate.value]!.value[index],
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
                activeBackgroundColor:
                    GetStorage().read("package_typ") == 1 ? mainColor : btnColor,
                activeTextColor: GetStorage().read("package_typ") == 1
                    ? blackTextColor
                    : Colors.white,
                inactiveBackgroundColor: Colors.grey.withOpacity(.2),
                inactiveTextColor: Colors.grey,
                disabledTextColor: blackTextColor,
                disabledBackgroundColor: Colors.white.withOpacity(.3),
                activeNavigatorColor: Colors.white,
                inactiveNavigatorColor: Colors.grey,
                // monthColor: Colors.purple,
                onDateChange: (date) {
                  setState(() {
                    AvailableGetxController.to.getAllAvailableSessions(date:DateFormat('yyyy-MM-dd').format(date),page: 1);
                  });
                },
              ),
              getSpace(h: 8.h),
              AvailableGetxController.to.avilableSessionLoading.value
                  ? buildSizedBoxLoading(context)
                  : AvailableGetxController
                          .to
                          .sessionsDay
                          .isEmpty
                      ? SizedBox(child: buildCenterNoData('لا يوجد مواعيد متاحة'))
                      : ListView.builder(
                          itemCount: AvailableGetxController
                              .to
                              .sessionsDay.length,
                          shrinkWrap: true,
                          padding: EdgeInsets.all(8.r),
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return ItemTwoWidget(
                              image: GetStorage().read("package_typ") == 1
                                  ? 'assets/images/card_background.png'
                                  : 'assets/images/card_background2.png',
                              backgroundColor:
                                  GetStorage().read("package_typ") == 1
                                      ? mainColor
                                      : btnColor,
                              session: AvailableGetxController.to.sessionsDay[index],
                            );
                          },
                        ),
              getSpace(h: 10.h),
              if (AvailableGetxController.to.isPageLoading.value)
                buildSizedBoxLoading(context)
            ],
          ),
        );
      }),
    );
  }

  buildSizedBoxLoading(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2.5.h,
      child: Transform.scale(
        scale: 0.2,
        child: LoadingIndicator(
          indicatorType: Indicator.ballSpinFadeLoader,

          /// Required, The loading type of the widget
          colors: [mainColor, btnColor],

          /// Optional, The color collections
          /// Optional, the stroke backgroundColor
        ),
      ),
    );
  }
}
