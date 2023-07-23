import 'package:dartz/dartz.dart';

import 'package:naz_gem/core/error/failures.dart';
import 'package:naz_gem/core/network/network_info.dart';

import 'package:naz_gem/features/booking/domain/entities/session.dart';

import '../../../../core/error/exceptions.dart';
import '../../domain/repository/avilabe_repo.dart';
import '../data_source/avilable_training_session/Training_session_remote_data_source.dart';

class AvialbleRepoImp extends AvailableRepo {
  NetworkInfo networkInfo;
  TrainingSessionRemoteDataSource trainingSessionRemoteDataSource;


  AvialbleRepoImp({required this.networkInfo, required this.trainingSessionRemoteDataSource});

  @override
  Future<Either<Failure, Session>> getTrainingSession(String id) async {
    if (await networkInfo.isConnected) {
      try {
        Session session = await trainingSessionRemoteDataSource.getTrainingSession(id);
        return Right(session);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, List<Session>>> getAllTrainingSessions() async {
    if (await networkInfo.isConnected) {
      try {
        final sessions = await trainingSessionRemoteDataSource.getAllTrainingSessions();
        return Right(sessions);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

}