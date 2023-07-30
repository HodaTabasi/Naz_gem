import 'package:dartz/dartz.dart';

import '../../model/session_model.dart';

abstract class TrainingSessionRemoteDataSource {
  Future<List<SessionModel>> getAllTrainingSessions(date,page);
  Future<SessionModel> getTrainingSession(String id);
}