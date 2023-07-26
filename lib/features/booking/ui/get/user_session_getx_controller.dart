import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:naz_gem/features/booking/domain/entities/reservation_session.dart';

import '../../../../core/constants/utils.dart';
import '../../data/repository/trainees_repo_imp.dart';
import '../../domain/use_case/cancel_session_use_case.dart';
import '../../domain/use_case/get_user_training_session_use_case.dart';
import '../../domain/use_case/get_user_training_sessions_use_case.dart';
import '../../domain/use_case/reservation_new_training_session_use_case.dart';

class UserSessionGetxController extends GetxController {
  var responseMessage = '';
  RxBool userSessionLoading = false.obs;
  RxMap<String, List<ReservationSession>> map =
      <String, List<ReservationSession>>{}.obs;
  RxString currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now()).obs;

  static UserSessionGetxController get to =>
      Get.find<UserSessionGetxController>();

  Future<bool> reservationUserSessions(String id) {
    EasyLoading.show(indicator: EasyLoading().indicatorWidget);
    return ReservationNewTrainingSessionsUseCase(
            repository: Get.find<TraineesRepoImp>())
        .call(id)
        .then((value) => value.fold((failure) {
              EasyLoading.dismiss();
              responseMessage = mapFailureToMessage(failure);
              return false;
            }, (session) async {
              EasyLoading.dismiss();
              update();
              return true;
            }));
  }

  cancelUserSessions(String id,{date}) {
    EasyLoading.show(indicator: EasyLoading().indicatorWidget);
    CancelSessionUseCase(repository: Get.find<TraineesRepoImp>())
        .call(id)
        .then((value) => value.fold((failure) {
          EasyLoading.dismiss();
          responseMessage = mapFailureToMessage(failure);
    }, (session) async {
          EasyLoading.dismiss();
          map[date]?.remove(session);
          refresh();
    }));
  }

  getUserSessions() {
    userSessionLoading.value = true;
    GetUserSessionsUseCase(repository: Get.find<TraineesRepoImp>())
        .call()
        .then((value) => value.fold((failure) {
              responseMessage = mapFailureToMessage(failure);
              userSessionLoading.value = false;
            }, (session) async {
          print(session);
              filtterByDate(session);
              userSessionLoading.value = false;
            }));
  }

  getUserSession(String id) {
    GetUserSessionUseCase(repository: Get.find<TraineesRepoImp>())
        .call(id)
        .then((value) => value.fold((failure) {}, (session) async {}));
  }

  void filtterByDate(List<ReservationSession> session) {
    putDataToMap();
    for (ReservationSession s in session) {
      if (map.containsKey(s.trainingSession?.date)) {
        map[s.trainingSession?.date]?.add(s);
      } else {
        map[s.trainingSession!.date!] = [];
        map[s.trainingSession?.date]?.add(s);
      }
    }
    print(map);
  }

  putDataToMap() {
    var startOfCurrentWeek = DateTime.now();
    for (int index = 0; index < 6; index++) {
      DateTime addDate = startOfCurrentWeek.add(Duration(days: (index)));
      index + 1;
      var s = DateFormat('yyyy-MM-dd').format(addDate);
      map[s] = [];
    }
  }
}
