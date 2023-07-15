import 'package:dartz/dartz.dart';
import 'package:naz_gem/features/profile/data/model/user_modle.dart';

abstract class ProfileRemoteDataSource {
  Future<Unit> updateUser(UserModel userModel);
  Future<UserModel> getUser(String userId);
}