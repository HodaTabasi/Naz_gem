import 'package:dartz/dartz.dart';

import '../../../auth/data/model/user_modle.dart';

abstract class ProfileRemoteDataSource {
  Future<Unit> updateUser(UserModel userModel);
  Future<UserModel> getUser(String userId);
}