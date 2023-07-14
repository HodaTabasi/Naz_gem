import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthGetxController extends GetxController {
  RxString mobile = RxString('');
  RxString mobileErrorText = RxString('');
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  GlobalKey<FormState> newUserKey = GlobalKey<FormState>();

  static AuthGetxController get to =>
      Get.find<AuthGetxController>();

  String? mobileValidation(String? value) {
    if(value == null){
      return 'enter Phone number';
    }else if(!GetUtils.isPhoneNumber(value)){
      return 'enter valid Phone number';
    } else {
      return null;
    }
  }

  String? emailValidation(String? value) {
    if(value == null){
      return 'enter email ';
    }else if(!GetUtils.isEmail(value)){
      return 'enter valid email ';
    } else {
      return null;
    }
  }


  String? nameValidation(String? value) {
    if(value == null || value.isEmpty){
      return 'enter required Filed ';
    } else {
      return null;
    }
  }



}