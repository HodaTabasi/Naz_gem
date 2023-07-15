import 'package:dartz/dartz.dart';

abstract class TrainingSessionRemoteDataSource {
  Future<Unit> getAllTrainingSessions();
  Future<Unit> getTrainingSession(String id);
  Future<Unit> reserveTrainingSession(String id);
}