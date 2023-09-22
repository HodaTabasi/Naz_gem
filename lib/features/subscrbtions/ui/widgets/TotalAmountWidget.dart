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

Package package = SubscrbtionGetxController.to.package;
  @override
  Widget build(BuildContext context) {
    var price = getDiscount(package)?? package.price;
    return GetBuilder<SubscrbtionGetxController>(
      builder: (controller) {
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
                subtitle: controller.checkResponse != null?Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Visibility(
                      visible:controller.checkResponse != null,
                      child: getText(
                          " ${getDiscount(package) ?? package.price} ريال",
                          color: grayTextColor1,
                          size: 15.sp,
                          decoration: TextDecoration.lineThrough,
                          align: TextAlign.center
                      ),
                    ),
                    getSpace(w: 16.r),
                    getText(
                        " ${controller.checkResponse!.priceAfterPartnerDiscount!} ريال",
                        color: blackTextColor,
                        size: 16.sp,
                        weight: FontWeight.w600,
                        // decoration: TextDecoration.lineThrough,
                        align: TextAlign.center
                    ),
                  ],
                ): getText(
                    " ${price} ريال",
                    color: blackTextColor,
                    size: 16.sp,
                    weight: FontWeight.w600,
                    // decoration: TextDecoration.lineThrough,
                    align: TextAlign.start
                ),
              )
            ],
          ),);
      }
    );
  }
}
