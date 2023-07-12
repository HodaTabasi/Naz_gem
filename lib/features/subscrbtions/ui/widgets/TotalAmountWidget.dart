import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/app_widget.dart';

class TotalAmountWidget extends StatelessWidget {
  const TotalAmountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      alignment: AlignmentDirectional.center,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/background1.png'),
            fit: BoxFit.fill
        ),
      ),
      child: Stack(
        children: [
          ListTile(
            leading: SvgPicture.asset('assets/images/icon.svg'),
            title: Text('payment'.tr),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                getText(
                    " 2000 ريال",
                    color: grayTextColor1,
                    size: 15.sp,
                    decoration: TextDecoration.lineThrough,
                    align: TextAlign.center
                ),
                getSpace(w: 16.r),
                getText(
                    " 1200 ريال",
                    color: blackTextColor,
                    size: 16.sp,
                    weight: FontWeight.w600,
                    // decoration: TextDecoration.lineThrough,
                    align: TextAlign.center
                ),
              ],
            ),
          )
        ],
      ),);
  }
}
