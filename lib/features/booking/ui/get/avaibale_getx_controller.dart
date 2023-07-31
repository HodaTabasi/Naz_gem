import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:naz_gem/features/booking/domain/use_case/get_session_use_case.dart';

import '../../../../core/constants/utils.dart';
import '../../data/repository/avilable_seisson_repo_imp.dart';
import '../../domain/entities/session.dart';
import '../../domain/use_case/get_all_session_use_case.dart';

class AvailableGetxController extends GetxController {
  RxBool avilableSessionLoading = false.obs;
  RxBool isPageLoading = false.obs;

  // RxMap<String, List<Session>> map = <String, List<Session>>{}.obs;
  RxList<Session> sessionsDay = <Session>[].obs;
  RxString currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now()).obs;

  String responseMessage = '';
  int lastPage = 1;
  int currentPage = 1;

  static AvailableGetxController get to => Get.find<AvailableGetxController>();

  getAllAvailableSessions({date, page}) {
    page >1 ?isPageLoading.value = true:avilableSessionLoading.value = true;

    GetAllSessionsUseCase(repository: Get.find<AvialbleRepoImp>())
        .call(date: date)
        .then((value) => value.fold((failure) {
              responseMessage = mapFailureToMessage(failure);
              avilableSessionLoading.value = false;
              isPageLoading.value = false;
            }, (session) async {
              if (date != currentDate) {
                sessionsDay.clear();
                currentDate.value = date;
                lastPage = GetStorage().read("lastPage");
              }else if(page <= 1){
                sessionsDay.clear();
              }
              sessionsDay.addAll(session);
              // filtterByDate(session);
              avilableSessionLoading.value = false;
              isPageLoading.value = false;
            }));
  }

  getAvailableSession(String id) {
    GetSessionUseCase(repository: Get.find<AvialbleRepoImp>())
        .call(id)
        .then((value) => value.fold((failure) {}, (session) async {}));
  }

  decreaseAvailableSession(session){
    int index =sessionsDay.indexWhere((element) => element == session);
    sessionsDay[index].availableSeats = sessionsDay[index].availableSeats! - 1;
  }
  increaseAvailableSession(session){
    int index = sessionsDay.indexWhere((element) => element == session);
    sessionsDay[index].availableSeats = sessionsDay[index].availableSeats! + 1;

  }

//عمل فلتر للداتا كل واحدة في مكانها الصحيح
// void filtterByDate(List<Session> session) {
//   putDataToMap();
//   for(Session s in session){
//     if(map.containsKey(s.date)){
//       map[s.date]?.add(s);
//     }else {
//       map[s.date!] = [];
//       map[s.date]?.add(s);
//     }
//   }
// }

// putDataToMap(){
//   var startOfCurrentWeek = DateTime.now();
//   for (int index = 0; index < 6; index++) {
//     DateTime addDate = startOfCurrentWeek.add(Duration(days: (index)));
//     index + 1;
//     var s = DateFormat('yyyy-MM-dd').format(addDate);
//     map[s] = [];
//   }
// }
}
