import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/app_widget.dart';

class ProfileItemWidgetDate extends StatelessWidget {
  final String icon;
  final String text;
  const ProfileItemWidgetDate({
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
                  getText('${getAge(text)} سنة ',color: grayTextColor,size: 12.sp),
                ],
              )
            ],
          ),
        ),
        getSpace(h: 16.h)
      ],
    );
  }

  getAge(String text) {
    if(text == 'dD/MM/YYYY'){
      return '';
    }
    return DateTime.now().year - int.parse(text.split("-").first);
  }
}