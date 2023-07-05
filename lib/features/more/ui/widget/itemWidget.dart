import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/app_widget.dart';

class itemWidget extends StatelessWidget {
  final String icon;
  final String text;
  const itemWidget({
    super.key,
    required this.icon,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 8.0.r),
      child: ListTile(
        tileColor: grayBackground,
        contentPadding: EdgeInsets.all(5.r),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r)
        ),
        title: getText(
          text,
          color: blackTextColor,
          size: 14.sp,
        ),
        // Text(text,style: TextStyle(color: blackTextColor, fontSize: 14.sp)),
        trailing: Icon(Icons.arrow_forward_ios),
        leading: SvgPicture.asset(icon),
      ),
    );
  }
}
