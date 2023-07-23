import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:naz_gem/features/contact_info/data/repository/contact_repo_imp.dart';
import 'package:naz_gem/features/contact_info/domain/entities/contact.dart';
import 'package:naz_gem/features/contact_info/domain/repository/contact_repo.dart';
import 'package:naz_gem/features/contact_info/domain/use_case/get_contact_use_case.dart';

import '../../../../core/constants/utils.dart';
import '../widgets/contact_class.dart';

class ContactGetxController extends GetxController {
  var responseMessage = '';
  List<Contact> contacts = [];
  bool isLogout = false;
  String facebook = '';
  String instagram = '';
  String youtube = '';
  String twitter = '';

  static ContactGetxController get to => Get.find<ContactGetxController>();

  getContact() {
    EasyLoading.show(indicator: EasyLoading().indicatorWidget);
    GetContactUseCase(repository: Get.find<ContactRepoImp>())
        .call()
        .then((value) =>
        value.fold((failure) {
          EasyLoading.dismiss();
          responseMessage = mapFailureToMessage(failure);
          update();
        }, (contacts) {
          this.contacts = contacts;
          putDataToInfoList(contacts);
          EasyLoading.dismiss();
          update();
        }));
  }

  logout() {
    EasyLoading.show(indicator: EasyLoading().indicatorWidget);
    GetContactUseCase(repository: Get.find<ContactRepoImp>())
        .call()
        .then((value) =>
        value.fold((failure) {
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


  void putDataToInfoList(List<Contact> contacts) {
    infoData[0].text = contacts
        .where((element) => element.key == 'phone')
        .first
        .value ?? '';
    infoData[1].text = contacts
        .where((element) => element.key == 'email')
        .first
        .value ?? '';
    infoData[2].text = contacts
        .where((element) => element.key == 'location')
        .first
        .value ?? '';
    infoData[3].text = contacts
        .where((element) => element.key == 'website')
        .first
        .value ?? '';


    /// constant
    facebook = contacts
        .where((element) => element.key == 'facebook')
        .first
        .value ?? '';
    instagram = contacts
        .where((element) => element.key == 'instagram')
        .first
        .value ?? '';
    youtube = contacts
        .where((element) => element.key == 'youtube')
        .first
        .value ?? '';
    twitter = contacts
        .where((element) => element.key == 'twitter')
        .first
        .value ?? '';
  }
}