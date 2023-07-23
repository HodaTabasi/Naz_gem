import 'package:dartz/dartz.dart';

import '../../model/session_model.dart';

abstract class TrainingSessionRemoteDataSource {
  Future<List<SessionModel>> getAllTrainingSessions();
  Future<SessionModel> getTrainingSession(String id);
}