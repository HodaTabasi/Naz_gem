import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/constants/app_colors.dart';
import '../../core/widgets/app_widget.dart';
import '../../core/widgets/app_button.dart';
import '../auth/ui/pages/login.dart';

class onboardWidget extends StatelessWidget {
  String text;
  String subText;
  String image;
  // VoidCallback onPress;

  onboardWidget({
    required String text,
    required String subText,
    required String image,
    // required VoidCallback onPress,
  })  : this.text = text,
        this.subText = subText,
        this.image = image;
        // this.onPress = onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          RichText(
            text: TextSpan(
              text: text,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'br',
                  fontSize: 33.sp),
              children: <TextSpan>[
                TextSpan(
                    text: 'bold1'.tr,
                    style: TextStyle(
                        color: mainColor, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          getSpace(h: 9.0.h),
          Text(
            subText,
            style: TextStyle(fontSize: 15.sp, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          getSpace(h: 9.0.h),
          BtnApp(title: 'login'.tr, color:mainColor ,textColor:blackTextColor, prsee: () {
            Get.offAll(()=>const LoginScreen(),transition: Transition.downToUp,
                duration: const Duration(milliseconds: 500));
          }),
          getSpace(h: MediaQuery.of(context).size.height / 7)
        ],
      ),
    );
  }
}
