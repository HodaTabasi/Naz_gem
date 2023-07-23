import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/session.dart';

abstract class AvailableRepo {
  Future<Either<Failure, List<Session>>> getAllTrainingSessions();
  Future<Either<Failure, Session>> getTrainingSession(String id);
}