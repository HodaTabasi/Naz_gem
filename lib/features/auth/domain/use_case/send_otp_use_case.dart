import 'package:dartz/dartz.dart';
import 'package:naz_gem/core/constants/api_response.dart';

import '../../../../core/error/failures.dart';
import '../repository/auth_repo.dart';

class SendOtpUseCase {
  AuthRepo repository;

  SendOtpUseCase({required this.repository});
  Future<Either<Failure, ApiResponse>> call(String phoneNumber) async {
    return await repository.sendOTP(phoneNumber);
  }
}