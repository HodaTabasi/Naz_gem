import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:naz_gem/features/booking/domain/entities/reservation_session.dart';

import '../../../../core/constants/utils.dart';
import '../../data/repository/trainees_repo_imp.dart';
import '../../domain/use_case/cancel_session_use_case.dart';
import '../../domain/use_case/get_training_session_history.dart';
import '../../domain/use_case/get_user_training_session_use_case.dart';
import '../../domain/use_case/get_user_training_sessions_use_case.dart';
import '../../domain/use_case/reservation_new_training_session_use_case.dart';

class UserSessionGetxController extends GetxController {
  var responseMessage = '';
  RxBool userSessionLoading = false.obs;
  RxMap<String, RxList<ReservationSession>> map =
      <String, RxList<ReservationSession>>{}.obs;
  RxString currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now()).obs;
  RxMap<int,List<ReservationSession>> reservationHistory = <int,List<ReservationSession>>{}.obs;

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
          print("object");
              EasyLoading.dismiss();
              map[session.trainingSession?.date]!.add(session);
              update();
              return true;
            }));
  }

  Future<bool> cancelUserSessions(String id,{date}) {
    EasyLoading.show(indicator: EasyLoading().indicatorWidget);
    return CancelSessionUseCase(repository: Get.find<TraineesRepoImp>())
        .call(id)
        .then((value) => value.fold((failure) {
          EasyLoading.dismiss();
          responseMessage = mapFailureToMessage(failure);
          update();
          return false;
    }, (session) async {
          EasyLoading.dismiss();
          print(date);
          map[date]?.removeWhere((element) => element.trainingSession?.date == date,);
          map[date]?.refresh();
          update();
          return true;
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

  getUserSessionsHistory() {
    userSessionLoading.value = true;
    EasyLoading.show(indicator: EasyLoading().indicatorWidget);
    GetUserSessionsHistoryUseCase(
        repository: Get.find<TraineesRepoImp>())
        .call()
        .then((value) => value.fold((failure) {
         userSessionLoading.value = false;
         EasyLoading.dismiss();
         responseMessage = mapFailureToMessage(failure);
    }, (session) async {
          getMapData(session);
          EasyLoading.dismiss();
      userSessionLoading.value = false;
    }));
  }


  void filtterByDate(List<ReservationSession> session) {
    putDataToMap();
    for (ReservationSession s in session) {
      if (map.containsKey(s.trainingSession?.date)) {
        map[s.trainingSession?.date]?.add(s);
      } else {
        map[s.trainingSession!.date!] = <ReservationSession>[].obs;
        map[s.trainingSession?.date]?.add(s);
      }
    }
    print(map);
  }

  putDataToMap() {
    var startOfCurrentWeek = DateTime.now();
    for (int index = 0; index < 7; index++) {
      DateTime addDate = startOfCurrentWeek.add(Duration(days: (index)));
      index + 1;
      var s = DateFormat('yyyy-MM-dd').format(addDate);
      map[s] = <ReservationSession>[].obs;
    }
  }

  void getMapData(List<ReservationSession> session) {
    reservationHistory[0] = <ReservationSession>[].obs;
    reservationHistory[1] = <ReservationSession>[].obs;
    for (ReservationSession s in session) {
      if (s.trainingSession?.categoryId == 2) {
        reservationHistory[0]?.add(s);
      } else {
        reservationHistory[1]?.add(s);
      }
    }
  }
}
