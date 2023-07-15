import 'package:dartz/dartz.dart';
import 'package:naz_gem/features/auth/data/model/user_modle.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(String phone,String otp);
  Future<UserModel> createAccount(UserModel userModel);
  // Future<Unit> logout();
  Future<Unit> updateUser(UserModel userModel);
  Future<UserModel> getUser(String userId);
  Future<Unit> sendOTP(String phoneNumber);
}