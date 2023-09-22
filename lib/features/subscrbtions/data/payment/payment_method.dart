import 'dart:convert';
import 'dart:io';

import 'package:flutter_paytabs_bridge/BaseBillingShippingInfo.dart';
import 'package:flutter_paytabs_bridge/IOSThemeConfiguration.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkApms.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkConfigurationDetails.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkLocale.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkTransactionClass.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkTransactionType.dart';
import 'package:flutter_paytabs_bridge/flutter_paytabs_bridge.dart';
import 'package:get_storage/get_storage.dart';
import 'package:naz_gem/features/auth/data/model/user_modle.dart';
import 'package:naz_gem/features/subscrbtions/domain/entities/card_data.dart';
import 'package:naz_gem/features/subscrbtions/ui/get/subscrbtions_getx_controller.dart';

class PaymentMethod {
//TODO IOS UPDATED
//Live Key
//   final paymentServerKey = "SWJNMGNWTK-JG629T9BDR-MZGJNRLT2H";
//   final paymentClientKey = "CQKMTP-27R76T-GMP7P2-79NHQK";
//   final paymentProfileId = "52842";
//   final paymentCartIdLive = "52842";
//   final merchantName = "aiph.mapp@aph.med.sa";
//   final merchantApplePayIndentifier = "merchant.com.aph.med.aphaaApp";
// final merchantApplePayIndentifier = "aiph.mapp@aph.med.sa";

//////////
//Test Key
  final paymentProfileId = "103377";
  final paymentServerKey = "S6JN6KRJHZ-J6W6HMHH2L-ZKTB9ZH2R2";
  final paymentClientKey = "CQKMVV-KHVN6G-VGHNHH-9NP9PK";
  final paymentCartIdLive = "103377";

  final paymentMerchantName = "ناز جيم";

  var context;
  late PaymentSdkConfigurationDetails configuration;

  PaymentMethod(this.context) {
    configuration = PaymentSdkConfigurationDetails();
  }

  void onBookClick(context, price, {permsNo}) {
    //TODO : validate form
    // if (cardNameController.text.isEmpty) {
    //   //TODO : show error message for card name
    //   return;
    // }
    // if (cardNumberController.text.isEmpty) {
    //   //TODO : show error message for card number
    //   return;
    // }
    // if (cardDateController.text.isEmpty) {
    //   //TODO : show error message for card date
    //   return;
    // }
    // if (cardCVVController.text.isEmpty) {
    //   //TODO : show error message for cvv
    //   return;
    // }

    //TODO : [if pass] Start payment by calling startCardPayment method and handle the transaction details
    doPaymentConfiguration(price);
    startPaymentWithCard(context, price);
  }

  void doPaymentConfiguration(price) {
    ///todo this data required to show payment page
    ///todo: here you need to add user data if exist at lest [*** user name and email]

    UserModel user = UserModel.fromJson(jsonDecode(GetStorage().read('user')));
    if (GetStorage().read('token') == null) {
      return;
    }
    var firstName = "${user.firstName} ${user.lastName}";
    var email = user.email ?? "t@t.com";
    var mobile = user.phone ?? "+970111111111";
    if (email.isEmpty) {
      email = "t@t.com";
    }
    print("$firstName $email , $mobile");
    var billingDetails = BillingDetails("$firstName", "$email", "$mobile",
        "st. 12", "eg", "dubai", "dubai", "12345");
    var shippingDetails = ShippingDetails("$firstName", "$email", "$mobile",
        "st. 12", "eg", "dubai", "dubai", "12345");

    //todo this data required to show alternativePaymentMethods
    List<PaymentSdkAPms> apms = [];
    apms.add(PaymentSdkAPms.AMAN);

    configuration = PaymentSdkConfigurationDetails(
        profileId: paymentProfileId,
        serverKey: paymentServerKey,
        clientKey: paymentClientKey,
        // cartId: paymentCartIdTest,
        cartId: paymentCartIdLive,
        // cartId: /*paymentCartIdLive*/ "${DateTime.now().microsecondsSinceEpoch}",
        showBillingInfo: false,
        transactionType: PaymentSdkTransactionType.SALE,
        transactionClass: PaymentSdkTransactionClass.ECOM,
        forceShippingInfo: false,
        cartDescription: "ناز جيم",
        merchantName: /*paymentMerchantName*/ paymentMerchantName,
        // merchantApplePayIndentifier:merchantApplePayIndentifier.trim(),
        screentTitle: "Pay with Card",
        billingDetails: billingDetails,
        shippingDetails: shippingDetails,
        locale: PaymentSdkLocale.EN,
        //PaymentSdkLocale.AR or PaymentSdkLocale.DEFAULT
        amount: double.parse("${price}"),
        //release her amount
        currencyCode: "SAR",
        merchantCountryCode: "SA",
        alternativePaymentMethods: apms,
        linkBillingNameWithCardHolderName: false);

    configuration.simplifyApplePayValidation = true;

    //Options to show billing and shipping info
    configuration.showBillingInfo = true;
    configuration.showShippingInfo = false;

    //Set merchant logo from the project assets:
    if (Platform.isIOS) {
      var theme = IOSThemeConfigurations();
      theme.logoImage = "assets/images/logo.png";
      configuration.iOSThemeConfigurations = theme;
    }
  }

  void startPaymentWithCard(context, price) {
    //test card data todo 4111111111111111  || name = Visa || cvv = 123
    FlutterPaytabsBridge.startCardPayment(configuration, (event) {
      // print(event);
      if (event["status"] == "success") {
        // Handle transaction details here.
        var transactionDetails = event["data"];
        print(transactionDetails.toString());

        if (transactionDetails["isSuccess"]) {
          print("successful transaction");
          SubscrbtionGetxController.to.payTabsResponseHandeling(transactionDetails: transactionDetails,flag: true);

        } else {
          //todo : here show  invalid card message
          print("failed transaction");
          SubscrbtionGetxController.to.payTabsResponseHandeling(flag: false);
          }
      } else if (event["status"] == "error") {
        print(event);
        SubscrbtionGetxController.to.payTabsResponseHandeling(flag: false);
 // Handle error here.
      } else if (event["status"] == "event") {
        SubscrbtionGetxController.to.payTabsResponseHandeling(flag: false);
      }
    });
  }
}
