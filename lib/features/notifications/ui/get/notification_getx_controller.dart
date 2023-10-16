import 'package:get/get.dart';

class NotificationGetxController extends GetxController {
  static NotificationGetxController get to => Get.find<NotificationGetxController>();
  RxList notifications = [].obs;
}