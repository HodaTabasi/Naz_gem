import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/app_widget.dart';

class itemWidget extends StatelessWidget {
  late String icon;
  late String text;
  late VoidCallback? onPoress;

   itemWidget({
    super.key,
    required this.icon,
    required this.text,
     this.onPoress
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 8.0.r),
      child: InkWell(
        onTap: onPoress,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.r,vertical: 20.r),
          decoration: BoxDecoration(
            color: grayBackground,
            borderRadius:  BorderRadius.circular(10.r)
          ),
          child: Row(
            children: [
              SvgPicture.asset(icon),
              getSpace(w: 10.w),
              getText(
                text,
                color: blackTextColor,
                size: 14.sp,
              ),
               const Spacer(),
              const Icon(Icons.arrow_forward_ios),
            ],

          ),
        ),
      ),
    );
  }
}
