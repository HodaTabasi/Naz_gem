import 'package:dartz/dartz.dart';
import 'package:naz_gem/features/auth/domain/entities/user.dart';
import 'package:naz_gem/features/auth/domain/repository/auth_repo.dart';

import '../../../../core/error/failures.dart';

class LoginUseCase {
  AuthRepo repository;

  LoginUseCase({required this.repository});
  Future<Either<Failure, User>> call(String phone,String otp) async {
    return await repository.login(phone,otp);
  }
}