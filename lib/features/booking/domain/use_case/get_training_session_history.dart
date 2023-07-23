import 'package:dartz/dartz.dart';
import 'package:naz_gem/features/booking/domain/entities/reservation_session.dart';
import 'package:naz_gem/features/booking/domain/repository/trainees_repo.dart';

import '../../../../core/error/failures.dart';

class GetUserSessionsHistoryUseCase {
  final TraineesRepo repository;

  GetUserSessionsHistoryUseCase({required this.repository});

  Future<Either<Failure, List<ReservationSession>>> call() async {
    return await repository.getUserTrainingSessionHistory();
  }
}