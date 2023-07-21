import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:naz_gem/features/contact_us/domain/entities/contact.dart';
import 'package:naz_gem/features/contact_us/domain/repository/contact_repo.dart';
import 'package:naz_gem/features/contact_us/domain/use_case/get_contact_use_case.dart';

import '../../../../core/constants/utils.dart';

class ContactGetxController extends GetxController {
  var responseMessage = '';
  List<Contact> contacts = [];
  bool isLogout = false;

  getContact(){
    EasyLoading.show(indicator: EasyLoading().indicatorWidget);
    GetContactUseCase(repository: Get.find<ContactRepo>())
        .call()
        .then((value) => value.fold((failure) {
      EasyLoading.dismiss();
      responseMessage = mapFailureToMessage(failure);
      update();
    }, (contacts) {
      EasyLoading.dismiss();
      this.contacts = contacts;
      update();
    }));
  }

  logout(){
    EasyLoading.show(indicator: EasyLoading().indicatorWidget);
    GetContactUseCase(repository: Get.find<ContactRepo>())
        .call()
        .then((value) => value.fold((failure) {
      EasyLoading.dismiss();
      responseMessage = mapFailureToMessage(failure);
      isLogout = false;
      update();
    }, (unit) {
      EasyLoading.dismiss();
      isLogout = true;
      update();
    }));
  }
}