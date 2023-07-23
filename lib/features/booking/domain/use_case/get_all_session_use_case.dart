import 'package:dartz/dartz.dart';
import 'package:naz_gem/core/error/failures.dart';
import 'package:naz_gem/features/booking/domain/repository/avilabe_repo.dart';

import '../entities/session.dart';

class GetAllSessionsUseCase {
  final AvailableRepo repository;

  GetAllSessionsUseCase({required this.repository});

  Future<Either<Failure, List<Session>>> call() async {
    return await repository.getAllTrainingSessions();
  }
}