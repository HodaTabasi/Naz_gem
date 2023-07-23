import 'package:get/get.dart';
import 'package:naz_gem/features/booking/domain/repository/trainees_repo.dart';
import 'package:naz_gem/features/booking/domain/use_case/cancel_session_use_case.dart';
import 'package:naz_gem/features/booking/domain/use_case/get_session_use_case.dart';
import 'package:naz_gem/features/booking/domain/use_case/get_user_training_sessions_use_case.dart';

import '../../domain/repository/avilabe_repo.dart';
import '../../domain/use_case/get_all_session_use_case.dart';
import '../../domain/use_case/get_training_session_history.dart';
import '../../domain/use_case/get_user_training_session_use_case.dart';
import '../../domain/use_case/reservation_new_training_session_use_case.dart';

class AvailableGetxController extends GetxController{

  getAllAvailableSessions() {
    GetAllSessionsUseCase(repository: Get.find<AvailableRepo>())
        .call()
        .then((value) => value.fold((failure) {

    }, (user) async {

    }));
  }

  getAvailableSession(String id) {
    GetSessionUseCase(repository: Get.find<AvailableRepo>())
        .call(id)
        .then((value) => value.fold((failure) {

    }, (user) async {

    }));
  }

  getUserSessions() {
    GetUserSessionsUseCase(repository: Get.find<TraineesRepo>())
        .call()
        .then((value) => value.fold((failure) {

    }, (user) async {

    }));
  }

  getUserSession(String id) {
    GetUserSessionUseCase(repository: Get.find<TraineesRepo>())
        .call(id)
        .then((value) => value.fold((failure) {

    }, (user) async {

    }));
  }

  getUserSessionsHistory() {
    GetUserSessionsHistoryUseCase(repository: Get.find<TraineesRepo>())
        .call()
        .then((value) => value.fold((failure) {

    }, (user) async {

    }));
  }

  cancelUserSessions(String id) {
    CancelSessionUseCase(repository: Get.find<TraineesRepo>())
        .call(id)
        .then((value) => value.fold((failure) {

    }, (user) async {

    }));
  }

  reservationUserSessions(String id) {
    ReservationNewTrainingSessionsUseCase(repository: Get.find<TraineesRepo>())
        .call()
        .then((value) => value.fold((failure) {

    }, (user) async {

    }));
  }
}