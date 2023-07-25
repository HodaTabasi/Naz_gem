import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:naz_gem/features/home/domain/entities/packages.dart';
import 'package:naz_gem/features/subscrbtions/data/repository/CheckRepoImp.dart';
import 'package:naz_gem/features/subscrbtions/domain/entities/check_response.dart';

import '../../../../core/constants/utils.dart';
import '../../domain/use_case/chec_use_case.dart';

class SubscrbtionGetxController extends GetxController {
  String responseMessage  = '';
  CheckResponse? checkResponse ;
  late Package package;


  static SubscrbtionGetxController get to =>
      Get.find<SubscrbtionGetxController>();

  var groupValue = 0;

  changeGroupValue({value}){
    groupValue = value;
    update();
  }

  Future<bool> checkPromoCode(String promoCode){
    EasyLoading.show(indicator: EasyLoading().indicatorWidget);
    return CheckUseCase(repository: Get.find<CheckRepoImp>())
        .call(promoCode)
        .then((value) => value.fold((failure) {
      EasyLoading.dismiss();
      responseMessage = mapFailureToMessage(failure);
      update();
      return false;
    }, (response) {
      EasyLoading.dismiss();
      checkResponse = response;
      update();
      return true;
    }));
  }
}