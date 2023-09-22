import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:naz_gem/core/constants/utils.dart';
import 'package:naz_gem/features/auth/domain/use_case/create_account_use_case.dart';
import 'package:naz_gem/features/auth/domain/use_case/login_use_case.dart';
import 'package:naz_gem/features/auth/domain/use_case/send_otp_use_case.dart';

import '../../data/repository/auth_repo_imp.dart';

class AuthGetxController extends GetxController {
  static AuthGetxController get to => Get.find<AuthGetxController>();
  bool appearOtp = false;
  bool isLogin = false;
  bool isCreated = false;
  String responseMessage = '';
  late String phone = '' ;
  TextEditingController num1Controller = TextEditingController();
  TextEditingController num2Controller = TextEditingController();
  TextEditingController num3Controller = TextEditingController();
  TextEditingController num6Controller = TextEditingController();

  bool checkControllerEmpty(){
    if(num1Controller.text.isNotEmpty &&
    num2Controller.text.isNotEmpty &&
    num3Controller.text.isNotEmpty &&
    num6Controller.text.isNotEmpty){
      return true;
    }else {
      return false;
    }
  }

  String makeCode(){
    return '${num1Controller.text}${num2Controller.text}${num3Controller.text}${num6Controller.text}';
  }

  isSameOTP(){
    return GetStorage().read('otp').toString() == makeCode();
  }

  despose(){
    num1Controller.text = '';
    num2Controller.text = '';
    num3Controller.text = '';
    num6Controller.text = '';
  }


  Future<bool> login({phone, otp}) {
    EasyLoading.show(indicator: EasyLoading().indicatorWidget);
    return LoginUseCase(repository: Get.find<AuthRepoImpl>())
        .call(phone,otp.toString())
        .then((value) => value.fold((failure) {
      EasyLoading.dismiss();
      responseMessage = mapFailureToMessage(failure);
      update();
      return  false;
    }, (user) async {
      EasyLoading.dismiss();
      String jsonString = jsonEncode(user);
      await GetStorage().write('user', jsonString);
      update();
      return  true;
    }));
  }

  Future<bool> sendOtp({phone}) {
    EasyLoading.show(indicator: EasyLoading().indicatorWidget);
    return SendOtpUseCase(repository: Get.find<AuthRepoImpl>())
        .call(phone)
        .then((value) => value.fold((failure) {
              EasyLoading.dismiss();
              responseMessage = mapFailureToMessage(failure);
              update();
              return false;
            }, (apiResponse) {
              EasyLoading.dismiss();
              responseMessage = apiResponse.message!;
              appearOtp = apiResponse.status!;
              update();
              return true;
            }));
  }

 Future<bool> createAccount({user}) {
    EasyLoading.show(indicator: EasyLoading().indicatorWidget);
    return CreateAccountUseCase(repository: Get.find<AuthRepoImpl>())
        .call(user)
        .then((value) => value.fold((failure) {
      EasyLoading.dismiss();
      responseMessage = mapFailureToMessage(failure);
          update();
      return false;

    }, (user) async {
      EasyLoading.dismiss();

      phone = user.phone;
      update();
      return true;
    }));
  }
}
