import 'package:dartz/dartz.dart';

import 'package:naz_gem/core/error/failures.dart';

import 'package:naz_gem/features/booking/domain/entities/reservation_session.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repository/trainees_repo.dart';
import '../data_source/trainees_training_session/trainees_training_session_remote_data_source.dart';

class TraineesRepoImp extends TraineesRepo {
  NetworkInfo networkInfo;
  TraineesTrainingSessionRemoteDataSource trainingSessionRemoteDataSource;


  TraineesRepoImp({required this.networkInfo,required this.trainingSessionRemoteDataSource});

  @override
  Future<Either<Failure, ReservationSession>> cancelUserTrainingSession(String id) async {
    if (await networkInfo.isConnected) {
      try {
        ReservationSession reservationSession = await trainingSessionRemoteDataSource.cancelUserTrainingSession(id);
        return Right(reservationSession);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, ReservationSession>> getUserTrainingSession(String id) async {
    if (await networkInfo.isConnected) {
      try {
        ReservationSession session = await trainingSessionRemoteDataSource.getUserTrainingSession(id);
        return Right(session);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, List<ReservationSession>>> getUserTrainingSessionHistory() async {
    if (await networkInfo.isConnected) {
      try {
        List<ReservationSession> session = await trainingSessionRemoteDataSource.getUserTrainingSessionHistory();
        return Right(session);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, List<ReservationSession>>> getUserTrainingSessions() async {
    if (await networkInfo.isConnected) {
      try {
        List<ReservationSession> session = await trainingSessionRemoteDataSource.getUserTrainingSessions();
        return Right(session);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, ReservationSession>> reservationNewTrainingSession(String id) async {
    if (await networkInfo.isConnected) {
      try {
        ReservationSession session = await trainingSessionRemoteDataSource.reservationNewTrainingSession(id);
        return Right(session);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

}