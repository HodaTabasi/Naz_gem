import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/reservation_session.dart';

abstract class TraineesRepo {
  Future<Either<Failure, List<ReservationSession>>> getUserTrainingSessions();
  Future<Either<Failure, ReservationSession>> getUserTrainingSession(String id);
  Future<Either<Failure, Unit>> cancelUserTrainingSession(String id);
  Future<Either<Failure, List<ReservationSession>>> getUserTrainingSessionHistory();
  Future<Either<Failure, ReservationSession>> reservationNewTrainingSession(String id);
}