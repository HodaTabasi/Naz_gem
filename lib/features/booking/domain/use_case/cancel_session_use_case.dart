import 'package:dartz/dartz.dart';
import 'package:naz_gem/features/booking/domain/entities/reservation_session.dart';
import 'package:naz_gem/features/booking/domain/repository/trainees_repo.dart';

import '../../../../core/error/failures.dart';

class CancelSessionUseCase {
  final TraineesRepo repository;

  CancelSessionUseCase({required this.repository});

  Future<Either<Failure, ReservationSession>> call(String id) async {
    return await repository.cancelUserTrainingSession(id);
  }
}