import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:naz_gem/core/constants/app_colors.dart';
import 'package:naz_gem/features/profile/ui/pages/qr_screen.dart';

import '../../../../core/widgets/app_widget.dart';
import '../widgets/lower_section/lower_section_widget.dart';
import '../widgets/profile_functions.dart';
import '../widgets/upper_section/upper_section_widget.dart';
import 'edit_profile.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      backgroundColor: btnColor,
      appBar: buildAppBar(),
        body: Stack(
          children: const [
            PositionedDirectional(
                top: 0,
                start: 0,
                end: 0,
                child: UpperSectionWidget()
            ),
            PositionedDirectional(
              bottom: 0,
              start: 0,
              end: 0,
              child: LowerSectionWidget(),
            ),
          ],
        ),
    );
  }
}

class ItemWidget extends StatelessWidget {
  final String icon;
  final String text;
  const ItemWidget({
    super.key,
   required this.icon,
   required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60.h,
          padding: EdgeInsets.all(8.r),
          // margin: EdgeInsets.all(10.r),
          decoration:BoxDecoration(
        color: grayBackground,
            borderRadius: BorderRadius.circular(10)
                  ),
          child: Row(
            children: [
              SvgPicture.asset(icon) ,
              getSpace(w:10.w),
              getText(text,color: Colors.black,size: 16.sp),
            ],

          ),
        ),
        getSpace(h: 16.h)
      ],
    );
  }
}

class ItemWidgetDate extends StatelessWidget {
  final String icon;
  final String text;
  const ItemWidgetDate({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60.h,
          padding: EdgeInsets.all(5.r),
          decoration:BoxDecoration(
              color: grayBackground,
              borderRadius: BorderRadius.circular(10)
          ),
          child: Row(
            children: [
              SvgPicture.asset(icon) ,
              getSpace(w:10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getText(text,color: Colors.black,size: 16.sp),
                  getText('25 سنة ',color: grayTextColor,size: 12.sp),
                ],
              )

            ],
          ),
        ),
        getSpace(h: 16.h)
      ],
    );
  }
}