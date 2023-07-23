import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants/snackbar_message.dart';

class ContactInfo {
  final String title;
   String text;
  final String image;

  ContactInfo(this.title, this.text, this.image);
}

List<ContactInfo> infoData = [
  ContactInfo('phone'.tr, '(480) 555-0103', 'assets/images/whats.svg'),
  ContactInfo('email_c'.tr, 'dimashurafa@gmail.com', 'assets/images/email.svg'),
  ContactInfo('location'.tr, ' جدة , حي النهضة', 'assets/images/location.svg'),
  ContactInfo('site'.tr, 'dimashurafa@gmail.com', 'assets/images/site.svg'),
];

SliverGridDelegateWithFixedCrossAxisCount buildSliverGridDelegateWithFixedCrossAxisCount() {
  return SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 12.h,
      mainAxisSpacing: 12.w);
}

Future<void> launch(Uri url,context) async {
  await canLaunchUrl(url)
      ? await launchUrl(url)
      : SnackBarMessage.showErrorSnackBar(message: 'خطا في الرابط', context: context);
}