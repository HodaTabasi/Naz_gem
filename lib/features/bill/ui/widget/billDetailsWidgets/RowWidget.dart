import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/app_widget.dart';

class RowWidget extends StatelessWidget {
  final String title;
  final String text;
  final bool flag;

  const RowWidget({super.key, required this.title, required this.text ,this.flag = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        getText(
            title,
            color: flag?redColor:blackTextColor,
            size: 14.sp,
            weight: flag?FontWeight.bold:null
        ),
        // Text(
        //   title,
        //   style: TextStyle(
        //     color: flag?redColor:blackTextColor,
        //     fontSize: 14.sp,
        //     fontWeight: flag?FontWeight.bold:null
        //   ),
        // ),
        getText(
          text,
          color: blackTextColor,
          size: 14.sp,
          // align: flag?FontWeight.bold:null
        ),
        // Text(
        //   text,
        //   style: TextStyle(
        //     color: blackTextColor,
        //     fontSize: 14.sp,
        //   ),
        // ),
      ],
    );
  }
}
