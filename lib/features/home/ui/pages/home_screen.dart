import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:naz_gem/core/constants/app_colors.dart';
import 'package:naz_gem/core/widgets/app_toggle.dart';
import 'package:naz_gem/core/widgets/app_widget.dart';
import 'package:naz_gem/features/home/ui/get/home_getx_controller.dart';
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
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      HomeGetxController.to.getSliders();
      HomeGetxController.to.getGalleries();
      HomeGetxController.to.getPackages();
    });


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      displacement: 250,
      backgroundColor: mainColor,
      color: blackTextColor,
      strokeWidth: 3,
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      onRefresh: () async {
        await Future.delayed(const Duration(milliseconds: 1500));
        WidgetsBinding.instance.addPostFrameCallback((_) {
          HomeGetxController.to.getSliders();
          HomeGetxController.to.getGalleries();
          HomeGetxController.to.getPackages();
        });
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar(),
        body: GetX<HomeGetxController>
          (builder: (controller) {
          return ListView(
            children: [
              controller.slidersLoading.value
                  ? buildSizedBoxLoading(context)
                  : buildSlider(controller),
              getText('pakages'.tr,
                  color: blackTextColor,
                  size: 20.sp,
                  weight: FontWeight.w500,
                  align: TextAlign.center),
              AppToggle(),
              controller.packagesLoading.value
                  ? buildSizedBoxLoading(context)
                  : controller.currentPackages.isEmpty
                  ? Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: buildCenterNoData('لا يوجد باقات متاحة'),
                  )
                  :GridView.builder(
                      padding: EdgeInsets.all(16.r),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: buildSliverGridDelegate(),
                      itemCount: controller.currentPackages.length,
                      itemBuilder: (context, index) {
                        return PakageItemWidget(
                            controller.currentPackages[index]);
                      },
                    ),
              controller.galleriesLoading.value
                  ? buildSizedBoxLoading(context)
                  : Column(
                      children: [
                        getText('images'.tr,
                            color: blackTextColor,
                            weight: FontWeight.w500,
                            size: 20.sp,
                            align: TextAlign.center),
                        ImagesListWidget(controller),
                        getText('vedios'.tr,
                            color: blackTextColor,
                            size: 20.sp,
                            weight: FontWeight.w500,
                            align: TextAlign.center),
                        VideosListWidget(controller),
                      ],
                    )
            ],
          );
        }),
      ),
    );
  }

  SizedBox buildSizedBoxLoading(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2.5.h,
      child:  Transform.scale(
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
