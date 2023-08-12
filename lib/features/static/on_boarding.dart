import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../navigation_bar/bottom_navigation_page.dart';
import '../auth/ui/pages/login.dart';
import 'onboard_widget.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int _currentPage = 0;

  late Timer _timer;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    // double w = MediaQuery.of(context).size.width;
    // double h =  MediaQuery.of(context).size.height;
    //
    // print(w);
    // print(h);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 80.h,
        actions: [
          Padding(
            padding: EdgeInsets.all(10.0.r),
            child: InkWell(
              onTap: () {
                Get.offAll(()=>const BottomNavigationPage(),transition: Transition.downToUp,
                    duration: const Duration(milliseconds: 500));
              },
              child: Row(
                children: [
                  Text("skip".tr, style: TextStyle(fontSize: 16.sp,color: Colors.white)),
                  SizedBox(
                    width: 8.h,
                  ),
                  Icon(Icons.arrow_forward_ios_rounded,color: Colors.white),
                ],
              ),
            ),
          )
        ],
      ),
      body: PageView(
        controller: _pageController,
        children: [
          onboardWidget(
            image: 'assets/images/onboarding3.png',
            text: 'board1'.tr,
            subText: 'desc1'.tr,
            // onPress: (){},
          ),
          onboardWidget(
            image: 'assets/images/onboarding1.png',
            text: 'board1'.tr,
            subText: 'desc1'.tr,
            // onPress: (){},
          ),
          onboardWidget(
            image: 'assets/images/onboarding2.png',
            text: 'board1'.tr,
            subText: 'desc1'.tr,
            // onPress: (){},
          ),
        ],
      ),
    );
  }
}

