import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:naz_gem/features/home/domain/entities/packages.dart';
import 'package:naz_gem/features/subscrbtions/data/repository/CheckRepoImp.dart';
import 'package:naz_gem/features/subscrbtions/domain/entities/check_response.dart';
import 'package:naz_gem/features/subscrbtions/domain/use_case/check_subscription_use_case.dart';
import 'package:naz_gem/features/subscrbtions/domain/use_case/send_bill_use_case.dart';

import '../../../../core/constants/utils.dart';
import '../../domain/entities/card_data.dart';
import '../../domain/use_case/chec_use_case.dart';
import '../pages/payment_screen.dart';

class SubscrbtionGetxController extends GetxController {
  String responseMessage  = '';
  CheckResponse? checkResponse ;
  late Package package;
  String promoCode  = '';
  CardData? data;
  String? amount;
  bool paymentDone = false;

  var promoController = TextEditingController();
  var dateController = TextEditingController();

  static SubscrbtionGetxController get to =>
      Get.find<SubscrbtionGetxController>();

  var groupValue = 0;

  changeGroupValue({value}){
    groupValue = value;
    update();
  }

  Future<bool> checkPromoCode(String promoCode,int id){
    EasyLoading.show(indicator: EasyLoading().indicatorWidget);
    return CheckUseCase(repository: Get.find<CheckRepoImp>())
        .call(promoCode,id)
        .then((value) => value.fold((failure) {
      EasyLoading.dismiss();
      responseMessage = mapFailureToMessage(failure);
      update();
      return false;
    }, (response) {
      EasyLoading.dismiss();
      checkResponse = response;
      update();
      return true;
    }));
  }

  Future<bool> checkSubscription(promoCode,startDate, amount, packageId){
    EasyLoading.show(indicator: EasyLoading().indicatorWidget);
    return CheckSubscriptionUseCase(repository: Get.find<CheckRepoImp>())
        .call(promoCode,startDate, amount, packageId)
        .then((value) => value.fold((failure) {
      EasyLoading.dismiss();
      responseMessage = mapFailureToMessage(failure);
      update();
      return false;
    }, (response) {
      EasyLoading.dismiss();
      update();
      return true;
    }));
  }

  Future<bool> sendBill(){
    EasyLoading.show(indicator: EasyLoading().indicatorWidget);
    return SendBillUseCase(repository: Get.find<CheckRepoImp>())
        .call(data!)
        .then((value) => value.fold((failure) {
      EasyLoading.dismiss();
      responseMessage = mapFailureToMessage(failure);
      update();
      return false;
    }, (response) {
      EasyLoading.dismiss();
      Get.to(() => PaymentScreen(), transition: Transition.downToUp,
          duration: const Duration(milliseconds: 300));
      update();
      return true;
    }));
  }

  payTabsResponseHandeling({transactionDetails, flag}) async {
    print("successful transaction");
    paymentDone = flag;
    if(transactionDetails != null){
      DateTime tempDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").parse(transactionDetails['paymentResult']['transactionTime']);
      String date = DateFormat("yyyy-MM-dd hh:mm:ss").format(tempDate);
      data = CardData(
        prmoCode: promoController.text,
          amount: amount.toString(),
          packageId: package.id.toString(),
          startDate: dateController.text,
          status: "1",
          transactionTime: date,
          cartCurrency: transactionDetails['cartCurrency'],
          payment_method: transactionDetails['paymentInfo']
          ['payment_method'],
          transactionReference: transactionDetails['transactionReference'],
          shippingDetails:
          transactionDetails['shippingDetails'].toString());
      await sendBill();
    }else{
      responseMessage = "failed transaction";
    }

  }
}