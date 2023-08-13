import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/app_widget.dart';

class ProfileItemWidget extends StatelessWidget {
  final String icon;
  final String text;
  const ProfileItemWidget({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    print("gdg $text");
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