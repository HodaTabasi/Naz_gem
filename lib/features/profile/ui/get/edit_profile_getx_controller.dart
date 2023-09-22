import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:naz_gem/features/profile/data/repository/profile_repo_imp.dart';
import 'package:naz_gem/features/profile/domain/use_case/update_user_use_case.dart';

import '../../../../core/constants/utils.dart';
import '../../../auth/domain/entities/user.dart';
import '../../domain/use_case/get_user_use_case.dart';

class EditProfileGetxController extends GetxController {
  static EditProfileGetxController get to =>
      Get.find<EditProfileGetxController>();
 late User myUser ;
 bool isUpdated = false;
 bool isLoading = true;
 String responseMessage = '';
  XFile? file ;

  getUser() {
    EasyLoading.show(indicator: EasyLoading().indicatorWidget);
    GetUserUseCase(repository: Get.find<ProfileRepoImp>())
        .call()
        .then((value) =>
        value.fold((failure) {
          EasyLoading.dismiss();
          responseMessage = mapFailureToMessage(failure);
          isLoading = false;
              update();
            }, (user) async {
          print(user);
          EasyLoading.dismiss();
          myUser =user;
          isLoading = false;
          update();
    }));
  }

  Future<bool> updateUser({user}) async {
    EasyLoading.show(indicator: EasyLoading().indicatorWidget);
    return await UpdateUserUseCase(repository: Get.find<ProfileRepoImp>())
        .call(user)
        .then((value) => value.fold((failure) {
      EasyLoading.dismiss();
        responseMessage = mapFailureToMessage(failure);
      update();
     return false;
    }, (user) async {
      EasyLoading.dismiss();
      myUser = user;
      update();
      return true;
    }));
  }
  changeImage(newFile){
    file = newFile;
    update();
  }
}