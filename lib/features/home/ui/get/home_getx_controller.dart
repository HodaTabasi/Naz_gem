import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:naz_gem/features/home/data/repository/home_repo_imp.dart';
import 'package:naz_gem/features/home/domain/entities/gallery.dart';
import 'package:naz_gem/features/home/domain/entities/packages.dart';
import 'package:naz_gem/features/home/domain/repository/homeRepo.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/utils.dart';
import '../../domain/entities/sliders.dart';
import '../../domain/use_case/get_all_packages_use_case.dart';
import '../../domain/use_case/get_gallery_use_case.dart';
import '../../domain/use_case/get_package_details_use_case.dart';
import '../../domain/use_case/get_sliders_use_case.dart';

class HomeGetxController extends GetxController {
  RxInt currentIndex = 0.obs;
  Rx<Color> subBackColor = btnColor.obs;
  Rx<Color> subTextColor = Colors.white.obs;

  //loading
  RxBool packagesLoading = false.obs;
  RxBool slidersLoading = false.obs;
  RxBool galleriesLoading = false.obs;

  //data
  RxList<Package> packages = <Package>[].obs;
  RxList<Package> currentPackages = <Package>[].obs;
  late Rx<Package> packageDeitails;

  RxList<MySlider> sliders = <MySlider>[].obs;
  RxList<Gallery> galleries = <Gallery>[].obs;

  String responseMessage = '';

  static HomeGetxController get to => Get.find<HomeGetxController>();

  changeCurrentIndex({index}) {
    currentIndex.value = index;
    if (index == 0) {
      subBackColor.value = btnColor;
      subTextColor.value = Colors.white;
      currentPackages.value = packages.where((p0) => p0.categoryId == 2).toList();
    } else {
      subBackColor.value = mainColor;
      subTextColor.value = blackTextColor;
      currentPackages.value = packages.where((p0) => p0.categoryId == 1).toList();
    }
  }

  getName(Package currentPackag) {
    if( currentPackag.categoryId == 2){
      return '${currentPackag.duration} ${currentPackag.durationTypeName}';
    }else if(currentPackag.categoryId == 1){
      return '${currentPackag.sessionsCount} كلاس ';
    }
  }

  getPackages() {
    packagesLoading.value = true;
    GetPackagesUseCase(repository: Get.find<HomeRepoImp>())
        .call()
        .then((value) => value.fold((failure) {
              EasyLoading.dismiss();
              packagesLoading.value = false;
              responseMessage = mapFailureToMessage(failure);
            }, (packages) async {
              currentPackages.value = packages.where((p0) => p0.categoryId == 2 ).toList();
              this.packages.value = packages;
              packagesLoading.value = false;
    }));
  }

  getPackage(id) {
    packagesLoading.value = true;
    GetPackageUseCase(repository: Get.find<HomeRepoImp>())
        .call(id)
        .then((value) => value.fold((failure) {
              packagesLoading.value = false;
              responseMessage = mapFailureToMessage(failure);
            }, (package) async {
              packagesLoading.value = false;
              packageDeitails.value = package;
            }));
  }

  getSliders() {
    slidersLoading.value = true;
    GetSliderUseCase(repository: Get.find<HomeRepoImp>())
        .call()
        .then((value) => value.fold((failure) {
              slidersLoading.value = false;
              responseMessage = mapFailureToMessage(failure);
              update();
            }, (sliders) async {
              slidersLoading.value = false;
              this.sliders.value = sliders;
            }));
  }

  getGalleries() {
    galleriesLoading.value = true;
    GetGalleryUseCase(repository: Get.find<HomeRepoImp>())
        .call()
        .then((value) => value.fold((failure) {
              galleriesLoading.value = false;
              responseMessage = mapFailureToMessage(failure);
            }, (galleries) async {
              galleriesLoading.value = false;
              this.galleries.value = galleries;
            }));
  }
}
