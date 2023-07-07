import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:naz_gem/core/constants/app_colors.dart';
import 'package:naz_gem/core/widgets/app_widget.dart';

import '../../../subscrbtions/ui/pages/subscrbtion_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
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
                onTap: () {}, //
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
        ),
        body: ListView(
          children: [
            SizedBox(
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
            ),
            Text(
              'pakages'.tr,
              style: TextStyle(
                fontSize: 20.sp,
                color: blackTextColor,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
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
                                  borderRadius:BorderRadius.only(
                                    topRight: Radius.circular(10.r),
                                    bottomRight: Radius.circular(10.r)
                                  )),
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
                                  borderRadius:BorderRadius.only(
                                    topLeft: Radius.circular(10.r),
                                    bottomLeft: Radius.circular(10.r)
                                  )),
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
            /*
            * TabBar(
                    onTap: (value) {
                      setState(() {
                        currentIndex = value;
                      });
                    },
                    labelColor:
                        currentIndex == 0 ? Colors.white : blackTextColor,
                    unselectedLabelColor: blackTextColor,
                    indicator: BoxDecoration(),
                    tabs: [
                      Container(
                        width: 200.w,
                        margin: EdgeInsets.symmetric(vertical: 5.r),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color:
                                currentIndex == 0 ? blackTextColor : tabColor),
                        child: Tab(
                          text: 'public_pakage'.tr,
                        ),
                      ),
                      Container(
                        width: 200.w,
                        margin: EdgeInsets.symmetric(vertical: 5.r),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: currentIndex == 1 ? mainColor : tabColor),
                        child: Tab(
                          text: 'private_pakage'.tr,
                        ),
                      ),
                    ]),*/
            GridView.builder(
              padding: EdgeInsets.all(16.r),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.w,
                mainAxisSpacing: 16.h,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(
                            color: boarderColorPakage,
                            width: 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 2,
                                offset: Offset(0, 4))
                          ],
                          color: Colors.white),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          getSpace(h: 25.h),
                          getText("شهر واحد",
                              color: grayTextColor,
                              size: 13.sp,
                              align: TextAlign.center),
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
                                  color: blackTextColor,
                                  size: 20.sp,
                                  weight: FontWeight.bold,
                                  align: TextAlign.center),
                            ],
                          )
                        ],
                      ),
                    ),
                    PositionedDirectional(
                      bottom: 0,
                      end: 0,
                      child: InkWell(
                        onTap: () {
                          Get.to(() => Subscrbtions());
                        },
                        child: Container(
                          width: 85.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12.r),
                                  topRight: Radius.circular(12.r)),
                              color: mainColor),
                          child: getText('sub'.tr,
                              color: blackTextColor,
                              size: 18.sp,
                              align: TextAlign.center),
                        ),
                      ),
                    ),
                    PositionedDirectional(
                      bottom: 0,
                      start: 0,
                      child: SizedBox(
                        width: 85.w,
                        height: 40.h,
                        child: getText('details'.tr,
                            color: sucndryColor1,
                            size: 18.sp,
                            align: TextAlign.center),
                      ),
                    )
                  ],
                );
              },
            ),
            getText('images'.tr,
                color: blackTextColor,
                weight: FontWeight.w500,
                size: 20.sp,
                align: TextAlign.center),
            SizedBox(
              height: 130,
              child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(8.0.r),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: Image.network(
                          "https://www.idonate.ie/images/newimage/sports-clubs-1.jpg",
                          fit: BoxFit.cover,
                          width: 120.w,
                          height: 130.h),
                    ),
                  );
                },
              ),
            ),
            getText('vedios'.tr,
                color: blackTextColor,
                size: 20.sp,
                weight: FontWeight.w500,
                align: TextAlign.center),
            SizedBox(
              height: 130,
              child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(8.0.r),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: Stack(
                        children: [
                          Image.network(
                            "https://www.idonate.ie/images/newimage/sports-clubs-1.jpg",
                            fit: BoxFit.cover,
                            width: 120.w,
                            height: 130.h,
                          ),
                          SizedBox(
                            width: 120,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                    "assets/images/vedio_icon.svg"),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
