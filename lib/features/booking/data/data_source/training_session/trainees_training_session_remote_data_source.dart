import 'package:dartz/dartz.dart';

abstract class TraineesTrainingSessionRemoteDataSource {
  Future<Unit> getUserTrainingSessions();
  Future<Unit> getUserTrainingSession(String id);
  Future<Unit> cancelUserTrainingSession(String id);
}