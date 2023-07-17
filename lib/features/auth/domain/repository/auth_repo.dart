import 'package:dartz/dartz.dart';
import 'package:naz_gem/features/auth/domain/entities/user.dart';

import '../../../../core/constants/api_response.dart';
import '../../../../core/error/failures.dart';

abstract class AuthRepo {
  Future<Either<Failure,User>> login(String phone,String otp);
  Future<Either<Failure,User>> createAccount(User userModel);
  Future<Either<Failure,ApiResponse>> sendOTP(String phoneNumber);
}