import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class GeneralGetxController extends GetxController {
  RxString mobile = RxString('');
  RxString mobileErrorText = RxString('');
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  GlobalKey<FormState> newUserKey = GlobalKey<FormState>();
  GlobalKey<FormState> profileKey = GlobalKey<FormState>();

  static GeneralGetxController get to =>
      Get.find<GeneralGetxController>();

  String? mobileValidation(String? value) {
    if(value == null || value.isEmpty){
      return 'lenght_condation'.tr;
    }else if(!GetUtils.isPhoneNumber(value)){
      return 'valid_phone'.tr;
    } else {
      return null;
    }
  }

  String? emailValidation(String? value) {
    if(value == null || value.isEmpty){
      return 'lenght_condation'.tr;
    }else if(!GetUtils.isEmail(value)){
      return 'valid_email'.tr;
    } else {
      return null;
    }
  }


  String? nameValidation(String? value) {
    if(value == null || value.isEmpty){
      return 'lenght_condation'.tr;
    } else if(value.length < 4) {
      return 'valid_name'.tr;
    }else {
      return null;
    }
  }



}