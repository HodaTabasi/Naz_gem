import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:naz_gem/core/network/network_info.dart';

import 'core/get/general_getx_controller.dart';
import 'features/auth/data/data_source/auth_remote_dataSource_imp.dart';
import 'features/auth/data/repository/auth_repo_imp.dart';
import 'features/auth/ui/get/auth_getx_controller.dart';
import 'features/subscrbtions/ui/get/subscrbtions_getx_controller.dart';
import 'package:http/http.dart' as http;

class MainInjection implements Bindings {
  @override
  void dependencies() {
    Get.put(SubscrbtionGetxController());
    Get.put(AuthGetxController());
    Get.put(GeneralGetxController());
    Get.put(AuthRepoImpl(remoteDataSource: AuthRemoteDataSourceImp(client:http.Client()),
        networkInfo: NetworkInfoImpl(InternetConnectionChecker())));
  }

}