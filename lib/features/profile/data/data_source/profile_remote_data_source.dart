import 'package:dartz/dartz.dart';

import '../../../auth/data/model/user_modle.dart';

abstract class ProfileRemoteDataSource {
  Future<UserModel> updateUser(UserModel userModel);
  Future<UserModel> updateUserWithOutImage(UserModel userModel);
  Future<UserModel> getUser();
}