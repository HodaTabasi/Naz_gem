import 'package:get/get.dart';

class AuthGetxController extends GetxController {
  RxString mobile = RxString('');
  RxString mobileErrorText = RxString('');

  static AuthGetxController get to =>
      Get.find<AuthGetxController>();

  String? mobileValidation(String? value) {
    if(!GetUtils.isPhoneNumber(value!)){
      return 'enter valid Phone number';
    } else {
      return null;
    }
  }


}