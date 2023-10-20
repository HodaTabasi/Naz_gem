import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:naz_gem/features/booking/ui/get/user_session_getx_controller.dart';
import 'package:naz_gem/features/booking/ui/widget/item_one.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/app_widget.dart';

class MyTimePage extends StatefulWidget {
  @override
  State<MyTimePage> createState() => _MyTimePageState();
}

class _MyTimePageState extends State<MyTimePage> {
  var currentIndex = 0;

  @override
  void initState() {
    UserSessionGetxController.to.getUserSessionsHistory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: getAppBar(
        text: 'my_booking'.tr,
        isBack: true,
        height: 80.h,
      ),
      body: GetX<UserSessionGetxController>(builder: (controller) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.r, vertical: 8.r),
              child: Container(
                  height: 53.h,
                  decoration: BoxDecoration(
                      border: Border.all(color: boarderColor, width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(
                                  MediaQuery.of(context).size.width / 2.2,
                                  currentIndex == 0 ? 80 : 50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10.r),
                                      bottomRight: Radius.circular(10.r))),
                              backgroundColor:
                                  currentIndex == 0 ? blackTextColor : tabColor,
                              elevation: 0),
                          onPressed: () {
                            setState(() {
                              currentIndex = 0;
                            });
                          },
                          child: Text(
                            'public_pakage'.tr,
                            style: TextStyle(
                                color: currentIndex == 0
                                    ? Colors.white
                                    : blackTextColor),
                          )),
                      // getSpace(w: 8.r),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(
                                  MediaQuery.of(context).size.width / 2.2,
                                  currentIndex == 1 ? 80 : 50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10.r),
                                      bottomLeft: Radius.circular(10.r))),
                              backgroundColor:
                                  currentIndex == 1 ? mainColor : tabColor,
                              elevation: 0),
                          onPressed: () {
                            setState(() {
                              currentIndex = 1;
                            });
                          },
                          child: Text('private_pakage'.tr,
                              style: TextStyle(
                                  color: currentIndex == 1
                                      ? Colors.white
                                      : blackTextColor)))
                    ],
                  )),
            ),
            controller.userSessionLoading.value
                ? const Center()
                : Expanded(
                    child:  controller.reservationHistory[currentIndex]!.isEmpty?
                    buildCenterNoData('لا يوجد حجوزات سابقة')
                        :ListView.builder(
                      itemCount: controller.reservationHistory[currentIndex]!.length,
                      padding: EdgeInsets.all(16.r),
                      itemBuilder: (context, index) {
                        return ItemOneWidget(
                          flag: true,
                          backgroundColor: currentIndex ==0 ?blackTextColor:mainColor,
                          my: false,
                          reservationSession: controller
                              .reservationHistory[currentIndex]![index],
                        );
                      },
                    ),
                  )
          ],
        );
      }),
    );
  }
}
