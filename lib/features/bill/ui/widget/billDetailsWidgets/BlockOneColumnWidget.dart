
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/app_widget.dart';

class BlockOneColumnWidget extends StatelessWidget {
  final String title1;
  final String title2;
  final String text1;
  final String text2;
  const BlockOneColumnWidget({
    super.key,
    required this.title1 ,
    required this.text1 ,
    required this.title2 ,
    required this.text2 ,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getText(
          title1,
          color: grayTextColor,
          size: 12.sp,
        ),

        getText(
          text1,
          color: blackTextColor,
          size: 16.sp,
        ),

        getSpace(h: 16.h),

        getText(
          title2,
          color: grayTextColor,
          size: 13.sp,
        ),
        getText(
          text2,
          color: blackTextColor,
          size: 16.sp,
        ),
      ],
    );
  }
}
