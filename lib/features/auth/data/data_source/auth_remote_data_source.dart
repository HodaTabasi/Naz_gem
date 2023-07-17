import 'package:dartz/dartz.dart';
import 'package:naz_gem/features/auth/data/model/user_modle.dart';

import '../../../../core/constants/api_response.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(String phone,String otp);
  Future<UserModel> createAccount(UserModel userModel);
  Future<ApiResponse> sendOTP(String phoneNumber);
}