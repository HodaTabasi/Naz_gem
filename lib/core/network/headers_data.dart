import 'dart:io';

import 'package:get_storage/get_storage.dart';



var headers = {
  HttpHeaders.authorizationHeader:"Bearer ${GetStorage().read('token')}",
};
