import 'package:dartz/dartz.dart';
import 'package:naz_gem/features/profile/domain/repository/profile_repo.dart';

import '../../../../core/error/failures.dart';
import '../../../auth/domain/entities/user.dart';

class UpdateUserUseCase {
  ProfileRepo repository;

  UpdateUserUseCase({required this.repository});

  Future<Either<Failure, User>> call(User user) async {
    return await repository.updateUser(user);
  }
}