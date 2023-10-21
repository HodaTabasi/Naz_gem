import 'package:dartz/dartz.dart';
import 'package:naz_gem/features/profile/domain/repository/profile_repo.dart';

import '../../../../core/error/failures.dart';
import '../../../auth/domain/entities/user.dart';

class UpdateUserWithoutImageUseCase {
  ProfileRepo repository;

  UpdateUserWithoutImageUseCase({required this.repository});

  Future<Either<Failure, User>> call(User user) async {
    return await repository.updateUserWithoutImage(user);
  }
}