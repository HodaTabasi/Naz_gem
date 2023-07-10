import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:naz_gem/core/constants/app_colors.dart';
import 'package:naz_gem/core/widgets/app_toggle.dart';
import 'package:naz_gem/core/widgets/app_widget.dart';
import 'package:naz_gem/features/home/ui/get/home_getx_controller.dart';
import '../../../subscrbtions/ui/pages/subscrbtion_screen.dart';
import '../widgets/image_list_widget.dart';
import '../widgets/pakage_item_widget.dart';
import '../widgets/video_list_widget.dart';
import '../widgets/widget_functions.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: ListView(
        children: [
          buildSlider(),
          getText('pakages'.tr,
              color: blackTextColor,
              size: 20.sp,
              weight: FontWeight.w500,
              align: TextAlign.center),
          AppToggle(),
          GridView.builder(
            padding: EdgeInsets.all(16.r),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: buildSliverGridDelegate(),
            itemCount: 4,
            itemBuilder: (context, index) {
              return PakageItemWidget();
            },
          ),
          getText('images'.tr,
              color: blackTextColor,
              weight: FontWeight.w500,
              size: 20.sp,
              align: TextAlign.center),
          ImagesListWidget(),
          getText('vedios'.tr,
              color: blackTextColor,
              size: 20.sp,
              weight: FontWeight.w500,
              align: TextAlign.center),
          VideosListWidget(),
        ],
      ),
    );
  }
}




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
