import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:naz_gem/features/bill/data/repository/bill_repo_imp.dart';

import '../../../../core/constants/utils.dart';
import '../../domain/entities/bill.dart';
import '../../domain/use_case/get_bill_use_case.dart';

class BillGetXController  extends GetxController{
  //loading
  RxBool billsLoading = false.obs;
  //data
  RxList<Bill> bills = <Bill>[].obs;
  Bill? bill;

  String responseMessage = "";

  static BillGetXController get to => Get.find<BillGetXController>();



  getBills() {
    EasyLoading.show(indicator: EasyLoading().indicatorWidget);
    GetBillUseCase(repository: Get.find<BillRepoImpl>())
        .call()
        .then((value) => value.fold((failure) {
      EasyLoading.dismiss();
      responseMessage = mapFailureToMessage(failure);
    }, (bills) async {
      EasyLoading.dismiss();
      this.bills.value = bills;
    }));
  }
}