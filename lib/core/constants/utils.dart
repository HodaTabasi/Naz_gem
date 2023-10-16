import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../features/booking/domain/entities/session.dart';
import '../error/failures.dart';
import '../strings/failures.dart';
import '../widgets/app_widget.dart';

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

String mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return SERVER_FAILURE_MESSAGE;
    case EmptyCacheFailure:
      return EMPTY_CACHE_FAILURE_MESSAGE;
    case OfflineFailure:
      return OFFLINE_FAILURE_MESSAGE;
    default:
      return ".. خطا غير متوقع حاول في ما بعد";
  }
}

getDiscount(currentPackage){
  if(currentPackage.discounts!.isNotEmpty){
    var priceAfterDiscount =(1-(currentPackage.discounts!.first.ratio!/100))  * num.parse(currentPackage.price!);
    print(priceAfterDiscount);
    return priceAfterDiscount;
  }
}

getTimeFrom24(Session session) {
  DateTime start = DateTime.parse('${session.date} ${session.startAt}');
  DateTime end = DateTime.parse('${session.date} ${session.endAt}');
  String s= DateFormat.jm().format(start).split(" ").first;
  String e = DateFormat.jm().format(end).split(' ').first;
  String time = DateFormat.jm().format(end).split(' ').last == 'PM' ?'مسائًا':'صباحا';
  return '$s - $e  $time ';
}

