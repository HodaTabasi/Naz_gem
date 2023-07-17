import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/model/user_modle.dart';
import '../entities/user.dart';
import '../repository/auth_repo.dart';

class CreateAccountUseCase {
  AuthRepo repository;

  CreateAccountUseCase({required this.repository});
  Future<Either<Failure, User>> call(User user) async {
    return await repository.createAccount(user);
  }
}