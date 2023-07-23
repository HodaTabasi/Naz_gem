import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../repository/contact_repo.dart';

class LogoutUseCase {
  final ContactRepo repository;

  LogoutUseCase({required this.repository});

  Future<Either<Failure, Unit>> call() async {
    return await repository.logout();
  }
}