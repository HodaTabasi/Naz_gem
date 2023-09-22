import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:naz_gem/core/constants/snackbar_message.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/app_widget.dart';
import '../get/subscrbtions_getx_controller.dart';

class PromoCodeWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SubscrbtionGetxController>
      (builder: (controller) {
      return Visibility(
        visible: controller.groupValue == 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getText(
              'enter_promo'.tr,
              color: blackTextColor,
              size: 16.sp,
            ),
            getSpace(h: 8.h),
            Row(
              children: [
                Expanded(
                    child: SizedBox(
                        height: 50.h,
                        child: AppTextField(
                          textController: SubscrbtionGetxController.to.promoController,
                          hint: '',
                          hasSufix: false,
                          textInputType: TextInputType.text,
                        ))),
                getSpace(w: 16.0.w),
                DecoratedBox(
                  decoration: BoxDecoration(
                      color: btnColor, borderRadius: BorderRadius.circular(5)),
                  child: IconButton(
                      onPressed: () async {
                        bool done = await SubscrbtionGetxController.to.checkPromoCode(SubscrbtionGetxController.to.promoController.text,SubscrbtionGetxController.to.package.id!);
                        if(done){
                          SubscrbtionGetxController.to.promoCode = SubscrbtionGetxController.to.promoController.text;
                          SnackBarMessage.showSuccessSnackBar(message: 'تم تفعيل الاشتراك', context: context);
                        }else {
                          SnackBarMessage.showErrorSnackBar(message: SubscrbtionGetxController.to.responseMessage, context: context);
                        }
                      },
                      icon: const Icon(Icons.arrow_forward),
                      color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
