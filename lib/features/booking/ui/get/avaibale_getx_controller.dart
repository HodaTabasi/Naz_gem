import 'package:get/get.dart';
import 'package:naz_gem/features/booking/domain/use_case/get_session_use_case.dart';

import '../../domain/repository/avilabe_repo.dart';
import '../../domain/use_case/get_all_session_use_case.dart';

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
}