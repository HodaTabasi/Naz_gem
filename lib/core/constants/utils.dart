import 'package:get/get.dart';

class Utils {
   static List<MYData> data = [
     MYData('assets/images/setting.svg','setting'.tr),
     MYData('assets/images/calendar_tick.svg','my_booking'.tr),
     MYData('assets/images/contact.svg','contact_w_us'.tr),
     MYData('assets/images/policy.svg','policy'.tr),
     MYData('assets/images/delete_account.svg','delete_account'.tr),
     MYData('assets/images/logout.svg','logout'.tr),
  ];
}

class MYData {
  String icon;
  String title;

  MYData(this.icon, this.title);


}