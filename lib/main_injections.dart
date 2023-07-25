import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:naz_gem/core/network/network_info.dart';
import 'package:naz_gem/features/booking/data/data_source/avilable_training_session/training_seisson_remote_dataSource_imp.dart';
import 'package:naz_gem/features/booking/data/data_source/trainees_training_session/trainee_training_seisson_remote_dataSource_imp.dart';
import 'package:naz_gem/features/booking/domain/repository/avilabe_repo.dart';
import 'package:naz_gem/features/contact_info/data/data_source/contact_data_source.dart';
import 'package:naz_gem/features/contact_info/data/data_source/contact_data_source_imp.dart';
import 'package:naz_gem/features/contact_info/data/repository/contact_repo_imp.dart';
import 'package:naz_gem/features/contact_info/domain/repository/contact_repo.dart';
import 'package:naz_gem/features/home/data/data_source/package_data_source_imp.dart';
import 'package:naz_gem/features/home/ui/get/home_getx_controller.dart';
import 'package:naz_gem/features/profile/data/repository/profile_repo_imp.dart';
import 'package:naz_gem/features/subscrbtions/data/data_source/partner_remote_data_source.dart';

import 'core/get/general_getx_controller.dart';
import 'features/auth/data/data_source/auth_remote_dataSource_imp.dart';
import 'features/auth/data/repository/auth_repo_imp.dart';
import 'features/auth/ui/get/auth_getx_controller.dart';
import 'features/booking/data/data_source/avilable_training_session/Training_session_remote_data_source.dart';
import 'features/booking/data/data_source/trainees_training_session/trainees_training_session_remote_data_source.dart';
import 'features/booking/data/repository/avilable_seisson_repo_imp.dart';
import 'features/booking/data/repository/trainees_repo_imp.dart';
import 'features/booking/ui/get/avaibale_getx_controller.dart';
import 'features/booking/ui/get/user_session_getx_controller.dart';
import 'features/contact_info/ui/get/contact_getx_controller.dart';
import 'features/home/data/data_source/package_data_source.dart';
import 'features/home/data/repository/home_repo_imp.dart';
import 'features/profile/data/data_source/profile_remote_dataSource_imp.dart';
import 'features/profile/ui/get/edit_profile_getx_controller.dart';
import 'features/subscrbtions/data/data_source/partner_remote_dataSource_imp.dart';
import 'features/subscrbtions/data/repository/CheckRepoImp.dart';
import 'features/subscrbtions/ui/get/subscrbtions_getx_controller.dart';
import 'package:http/http.dart' as http;

class MainInjection implements Bindings {
  @override
  void dependencies() {
    NetworkInfoImpl networkInfoImpl = NetworkInfoImpl(InternetConnectionChecker());
    var connect = http.Client();
    Get.put(SubscrbtionGetxController());
    Get.put(AuthGetxController());
    Get.put(GeneralGetxController());
    Get.put(EditProfileGetxController());
    Get.put(ContactGetxController());
    Get.put(HomeGetxController());
    Get.put(AvailableGetxController());
    Get.put(UserSessionGetxController());

    Get.put(AuthRepoImpl(remoteDataSource: AuthRemoteDataSourceImp(client:connect),
        networkInfo: networkInfoImpl));

    Get.put(ProfileRepoImp(remoteDataSource: ProfileRemoteDataSourceImp(client:connect),
        networkInfo: networkInfoImpl));

    Get.put(ContactRepoImp(contactDataSource: ContactDataSourceImp(client:connect),
        networkInfo: networkInfoImpl));

    Get.put(HomeRepoImp(dataSource: PackageDataSourceImp(client:connect),
        networkInfo: networkInfoImpl));

    Get.put(CheckRepoImp(partnerRemoteDataSource: PartnerRemoteDataSourceImp(client:connect),
        networkInfo: networkInfoImpl));

    Get.put(AvialbleRepoImp(trainingSessionRemoteDataSource: TrainingSessionRemoteDataSourceImp(client:connect),
        networkInfo: networkInfoImpl));

    Get.put(TraineesRepoImp(trainingSessionRemoteDataSource: TraineesTrainingSessionRemoteDataSourceImp(client:connect),
        networkInfo: networkInfoImpl));
  }

}