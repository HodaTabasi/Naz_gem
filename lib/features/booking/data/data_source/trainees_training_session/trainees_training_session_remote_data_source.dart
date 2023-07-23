import 'package:dartz/dartz.dart';

import '../../model/reservation_session_model.dart';

abstract class TraineesTrainingSessionRemoteDataSource {
  Future<List<ReservationSessionModel>> getUserTrainingSessions();
  Future<ReservationSessionModel> getUserTrainingSession(String id);
  Future<Unit> cancelUserTrainingSession(String id);
  Future<List<ReservationSessionModel>> getUserTrainingSessionHistory();
  Future<ReservationSessionModel> reservationNewTrainingSession();
}