import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:naz_gem/features/subscrbtions/domain/entities/check_response.dart';
import 'package:naz_gem/features/subscrbtions/domain/repository/check_repo.dart';

import '../../../../core/constants/utils.dart';
import '../../domain/use_case/chec_use_case.dart';

class SubscrbtionGetxController extends GetxController {
  String responseMessage  = '';
  late CheckResponse checkResponse ;


  static SubscrbtionGetxController get to =>
      Get.find<SubscrbtionGetxController>();

  var groupValue = 0;

  changeGroupValue({value}){
    groupValue = value;
    update();
  }

  checkPromoCode(String promoCode){
    EasyLoading.show(indicator: EasyLoading().indicatorWidget);
    CheckUseCase(repository: Get.find<CheckRepo>())
        .call(promoCode)
        .then((value) => value.fold((failure) {
      EasyLoading.dismiss();
      responseMessage = mapFailureToMessage(failure);
      update();
    }, (response) {
      EasyLoading.dismiss();
      checkResponse = response;
      update();
    }));
  }
}