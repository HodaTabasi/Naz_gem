import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:naz_gem/features/booking/data/repository/trainees_repo_imp.dart';
import 'package:naz_gem/features/booking/domain/repository/trainees_repo.dart';
import 'package:naz_gem/features/booking/domain/use_case/cancel_session_use_case.dart';
import 'package:naz_gem/features/booking/domain/use_case/get_session_use_case.dart';
import 'package:naz_gem/features/booking/domain/use_case/get_user_training_sessions_use_case.dart';

import '../../data/repository/avilable_seisson_repo_imp.dart';
import '../../domain/entities/session.dart';
import '../../domain/repository/avilabe_repo.dart';
import '../../domain/use_case/get_all_session_use_case.dart';
import '../../domain/use_case/get_training_session_history.dart';
import '../../domain/use_case/get_user_training_session_use_case.dart';
import '../../domain/use_case/reservation_new_training_session_use_case.dart';

class AvailableGetxController extends GetxController {
  RxBool avilableSessionLoading = false.obs;
  RxMap<String, List<Session>> map = <String, List<Session>>{}.obs;
  RxString currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now()).obs;

  static AvailableGetxController get to => Get.find<AvailableGetxController>();

  getAllAvailableSessions() {
    avilableSessionLoading.value = true;
    GetAllSessionsUseCase(repository: Get.find<AvialbleRepoImp>())
        .call()
        .then((value) => value.fold((failure) {
              avilableSessionLoading.value = false;
            }, (session) async {
              filtterByDate(session);
              avilableSessionLoading.value = false;
            }));
  }

  getAvailableSession(String id) {
    GetSessionUseCase(repository: Get.find<AvialbleRepoImp>())
        .call(id)
        .then((value) => value.fold((failure) {}, (session) async {}));
  }

  getUserSessions() {
    GetUserSessionsUseCase(repository: Get.find<TraineesRepoImp>())
        .call()
        .then((value) => value.fold((failure) {}, (session) async {}));
  }

  getUserSession(String id) {
    GetUserSessionUseCase(repository: Get.find<TraineesRepoImp>())
        .call(id)
        .then((value) => value.fold((failure) {}, (session) async {}));
  }

  getUserSessionsHistory() {
    GetUserSessionsHistoryUseCase(repository: Get.find<TraineesRepoImp>())
        .call()
        .then((value) => value.fold((failure) {}, (session) async {}));
  }

  cancelUserSessions(String id) {
    CancelSessionUseCase(repository: Get.find<TraineesRepoImp>())
        .call(id)
        .then((value) => value.fold((failure) {}, (session) async {}));
  }


  //عمل فلتر للداتا كل واحدة في مكانها الصحيح
  void filtterByDate(List<Session> session) {
    putDataToMap();
    for(Session s in session){
      if(map.containsKey(s.date)){
        map[s.date]?.add(s);
      }else {
        map[s.date!] = [];
        map[s.date]?.add(s);
      }
    }
  }

  putDataToMap(){
    var startOfCurrentWeek = DateTime.now();
    for (int index = 0; index < 6; index++) {
      DateTime addDate = startOfCurrentWeek.add(Duration(days: (index)));
      index + 1;
      var s = DateFormat('yyyy-MM-dd').format(addDate);
      map[s] = [];
    }
  }
}


