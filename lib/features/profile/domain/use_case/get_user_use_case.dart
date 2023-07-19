import 'package:dartz/dartz.dart';
import 'package:naz_gem/features/profile/domain/repository/profile_repo.dart';

import '../../../../core/error/failures.dart';
import '../../../auth/domain/entities/user.dart';

class GetUserUseCase {
  ProfileRepo repository;

  GetUserUseCase({required this.repository});

  Future<Either<Failure, User>> call() async {
    return await repository.getUser();
  }
}