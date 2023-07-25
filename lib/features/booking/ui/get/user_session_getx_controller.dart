
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../../core/constants/utils.dart';
import '../../data/repository/trainees_repo_imp.dart';
import '../../domain/use_case/reservation_new_training_session_use_case.dart';

class UserSessionGetxController extends GetxController {
  var responseMessage = '';



  static UserSessionGetxController get to => Get.find<UserSessionGetxController>();

  Future<bool> reservationUserSessions(String id) {
    EasyLoading.show(indicator: EasyLoading().indicatorWidget);
    return ReservationNewTrainingSessionsUseCase(repository: Get.find<TraineesRepoImp>())
        .call(id)
        .then((value) =>
        value.fold((failure) {
          EasyLoading.dismiss();
          responseMessage = mapFailureToMessage(failure);
          return false;
        }, (session) async {
          EasyLoading.dismiss();
          update();
          return true;
                }));
  }

}