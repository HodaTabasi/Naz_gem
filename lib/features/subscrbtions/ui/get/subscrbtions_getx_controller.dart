import 'package:get/get.dart';

class SubscrbtionGetxController extends GetxController {

  static SubscrbtionGetxController get to =>
      Get.find<SubscrbtionGetxController>();

  var groupValue = 0;

  changeGroupValue({value}){
    groupValue = value;
    update();
  }
}