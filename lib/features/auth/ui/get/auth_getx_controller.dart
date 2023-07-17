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



  login({phone, otp}) {
    EasyLoading.show(indicator: EasyLoading().indicatorWidget);
    LoginUseCase(repository: Get.find<AuthRepoImpl>())
        .call(phone,otp.toString())
        .then((value) => value.fold((failure) {
      EasyLoading.dismiss();
      responseMessage = mapFailureToMessage(failure);
      isLogin = false;
      update();
    }, (user) async {
      EasyLoading.dismiss();
      String jsonString = jsonEncode(user);
      await GetStorage().write('user', jsonString);
      isLogin = true;
      update();
    }));
  }

  sendOtp({phone}) {
    EasyLoading.show(indicator: EasyLoading().indicatorWidget);
    SendOtpUseCase(repository: Get.find<AuthRepoImpl>())
        .call(phone)
        .then((value) => value.fold((failure) {
              EasyLoading.dismiss();
              responseMessage = mapFailureToMessage(failure);
              update();
            }, (apiResponse) {
              EasyLoading.dismiss();
              responseMessage = apiResponse.message!;
              appearOtp = apiResponse.status!;
              update();
            }));
  }

  createAccount({user}) {
    EasyLoading.show(indicator: EasyLoading().indicatorWidget);
    CreateAccountUseCase(repository: Get.find<AuthRepoImpl>())
        .call(user)
        .then((value) => value.fold((failure) {
          print("Fgdfgd $responseMessage");
      EasyLoading.dismiss();
      responseMessage = mapFailureToMessage(failure);
      isCreated = false;
      update();
    }, (user) async {
      EasyLoading.dismiss();
      isCreated = true;
      phone = user.phone;
      update();
    }));
  }
}
