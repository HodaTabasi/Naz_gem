import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:naz_gem/core/constants/utils.dart';
import 'package:naz_gem/features/contact_us/ui/pages/contact_us_page.dart';
import 'package:naz_gem/features/booking/ui/pages/my_time.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/app_widget.dart';
import '../widget/itemWidget.dart';

class MorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: getAppBar(text: 'more'.tr, isBack: false, height: 60.h),
      body: ListView.builder(
        itemCount: Utils.data.length,
        padding: EdgeInsets.all(16.r),
        itemBuilder: (context, index) {
          return itemWidget(
            text: Utils.data[index].title,
            icon: Utils.data[index].icon,
            onPoress: () => goToFunction(index, context),
          );
        },
      ),
    );
  }
}

showAlertDialog(BuildContext context, image, title, content) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: getText(
      "yes".tr,
      color: redColor,
      size: 16.sp,
    ),
    onPressed: () {},
  );
  Widget continueButton = TextButton(
    child: getText(
      "no".tr,
      color: blackTextColor,
      size: 16.sp,
    ),
    onPressed: () {
      Get.back();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: SizedBox(
      child: Row(
        children: [
          SvgPicture.asset('assets/images/$image'),
          getSpace(w: 10.w),
          getText(
            title,
            color: blackTextColor,
            size: 14.sp,
          ),
        ],
      ),
    ),
    content: Text(content),
    actions: [
      cancelButton,
      continueButton,
    ],
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.r),
    ),
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

goToFunction(int index, context) {
  switch (index) {
    case 0:
      break;
    case 1:
      Get.to(() => MyTimePage(),
          transition: Transition.downToUp,
          duration: const Duration(milliseconds: 500));
      break;
    case 2:
      Get.to(() => ContactUsPage(),
          transition: Transition.downToUp,
          duration: const Duration(milliseconds: 500));
      break;
    case 3:
      break;
    case 4:
      showAlertDialog(
          context, 'delete_account1.svg', "delete_account".tr, "do_delete".tr);
      break;
    case 5:
      showAlertDialog(context, 'logout1.svg', "logout".tr, "do_out".tr);
      break;
  }
}
