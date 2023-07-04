import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:naz_gem/core/constants/app_colors.dart';
import 'package:naz_gem/core/constants/app_widget.dart';
import 'package:naz_gem/features/booking/ui/pages/booking_screen.dart';

import '../../../../core/widgets/app_button.dart';

class PaymentScreen extends StatefulWidget {

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/done_pay.png'),
            getSpace(h: 8.r),
            Text('hint_meg'.tr,style: TextStyle(
              color: blackTextColor,
              fontSize: 16.sp,
            ),),
            getSpace(h: 16.h),
            BtnApp(title: 'connect'.tr, prsee: (){
              Get.offAll(()=>BookingScreen());
            }, color: btnColor)
          ],
        ),
      ),
    );
  }
}
