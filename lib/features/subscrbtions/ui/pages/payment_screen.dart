import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:naz_gem/core/constants/app_colors.dart';
import 'package:naz_gem/core/widgets/app_widget.dart';
import 'package:naz_gem/features/booking/ui/pages/booking_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/widgets/app_button.dart';
import '../../../../navigation_bar/bottom_navigation_page.dart';

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
            getText(
              'hint_meg'.tr,
              color: blackTextColor,
              size: 16.sp,
            ),
            getSpace(h: 16.h),
            BtnApp(title: 'connect'.tr, prsee: (){

              whatsapp();
            }, color: btnColor),
            TextButton(onPressed: (){
              Get.offAll(()=>BottomNavigationPage(),transition: Transition.downToUp,
                  duration: const Duration(milliseconds: 500));
            }, child: getText('back'.tr,size: 16.sp,color: btnColor))
          ],
        ),
      ),
    );
  }
  whatsapp() async{
    var contact = "880123232333";
    var androidUrl = "whatsapp://send?phone=$contact&text=Hi, I need some help";
    var iosUrl = "https://wa.me/$contact?text=${Uri.parse('Hi, I need some help')}";

    try{
      if(Platform.isIOS){
        await launchUrl(Uri.parse(Uri.encodeFull(iosUrl)));
      }
      else{
        await launchUrl(Uri.parse(Uri.encodeFull(androidUrl)));
      }
    } on Exception{
      print("gdgdfgdf");
      // EasyLoading.showError('WhatsApp is not installed.');
    }
  }
}
