import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:naz_gem/core/constants/app_colors.dart';
import 'package:naz_gem/core/widgets/app_widget.dart';
import 'package:naz_gem/features/contact_us/ui/widgets/contact_class.dart';

class ContactUsPage extends StatefulWidget {
  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: getAppBar(
        text: 'contact_us'.tr,
        isBack: true,
        height: 80.h,
        textColor: Colors.white,
      ),
      body: Stack(
        children: [
          PositionedDirectional(
            top: 0,
            start: 0,
            end: 0,
            child: Container(
              height: 350.h,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/contact_image.png'),
                      fit: BoxFit.fill)),
            ),
          ),
          PositionedDirectional(
            bottom: 0,
            start: 0,
            end: 0,
            child: Container(
              padding: EdgeInsets.all(16.r),
              height: MediaQuery.of(context).size.height - 210.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.r),
                      topLeft: Radius.circular(20.r))),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    getSpace(
                        h: 16.h
                    ),
                    getText(
                      'contact_info'.tr,
                      size: 18.sp,
                      color: blackTextColor,
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12.h,
                          mainAxisSpacing: 12.w),
                      itemCount: infoData.length,
                      itemBuilder: (context, index) {
                        return DecoratedBox(
                          decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: boarderColor,
                            width: 1
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              offset: Offset(0,2),
                              blurRadius: 3
                            )
                          ]
                        ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                             SvgPicture.asset(infoData[index].image),
                              getText(
                                infoData[index].title,
                                size: 12.sp,
                                color: blackTextColor,
                              ),
                              getText(
                                infoData[index].text,
                                size: 12.sp,
                                color: blackTextColor,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    getSpace(h: 16.h),
                    getText(
                      'work_time'.tr,
                      size: 18.sp,
                      color: blackTextColor,
                    ),
                    getSpace(h: 10.h),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: boarderColor,
                            width: 1
                        ),
                    ),
                      child: ListTile(
                        leading: SvgPicture.asset('assets/images/time_work.svg'),
                        title:getText('السبت - الخميس : 8:00 صباحًا لـ 10:00 مسائًا',color: blackTextColor,size: 14.sp) ,
                        subtitle: getText('الجمعة : 4:00 لـ 10:00 مسائًا',color: blackTextColor,size: 14.sp),
                      ),
                    ),
                    getSpace(h: 16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/images/instagram.svg'),
                        SvgPicture.asset('assets/images/facebook.svg'),
                        SvgPicture.asset('assets/images/youtube.svg'),
                        SvgPicture.asset('assets/images/twitter.svg'),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
