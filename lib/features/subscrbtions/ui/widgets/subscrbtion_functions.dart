import 'dart:io';

import 'package:url_launcher/url_launcher.dart';

whatsapp() async{
  var contact = "880123232333";
  var androidUrl = "whatsapp://send?phone=$contact&text=Hi, I need some help";
  var iosUrl = "https://wa.me/$contact?text=${Uri.parse('Hi, I need some help')}";

  try{
    if(Platform.isIOS){
      await launchUrl(Uri.parse(Uri.encodeFull(iosUrl)));
    }
    else{
      await launchUrl(Uri.parse(Uri.encodeFull(androidUrl)));
    }
  } on Exception{
    print("gdgdfgdf");
    // EasyLoading.showError('WhatsApp is not installed.');
  }
}