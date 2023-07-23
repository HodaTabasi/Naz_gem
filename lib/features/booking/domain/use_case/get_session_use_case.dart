import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/session.dart';
import '../repository/avilabe_repo.dart';

class GetSessionUseCase {
  final AvailableRepo repository;

  GetSessionUseCase({required this.repository});

  Future<Either<Failure, Session>> call(String id) async {
    return await repository.getTrainingSession(id);
  }
}