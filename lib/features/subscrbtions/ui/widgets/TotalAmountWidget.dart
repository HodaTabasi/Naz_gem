import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:naz_gem/core/constants/utils.dart';
import 'package:naz_gem/features/home/domain/entities/packages.dart';
import 'package:naz_gem/features/subscrbtions/ui/get/subscrbtions_getx_controller.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/app_widget.dart';

class TotalAmountWidget extends StatelessWidget {
  TotalAmountWidget({
    super.key,
  });
Package package = SubscrbtionGetxController.to.package;
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
                Visibility(
                  visible:package.discounts!.isNotEmpty,
                  child: getText(
                      " ${package.price} ريال",
                      color: grayTextColor1,
                      size: 15.sp,
                      decoration: TextDecoration.lineThrough,
                      align: TextAlign.center
                  ),
                ),
                getSpace(w: 16.r),
                getText(
                    " ${getDiscount(package) ?? package.price} ريال",
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
