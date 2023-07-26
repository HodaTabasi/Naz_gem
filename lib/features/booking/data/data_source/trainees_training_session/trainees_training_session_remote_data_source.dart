import 'package:dartz/dartz.dart';

import '../../model/reservation_session_model.dart';

abstract class TraineesTrainingSessionRemoteDataSource {
  Future<List<ReservationSessionModel>> getUserTrainingSessions();
  Future<ReservationSessionModel> getUserTrainingSession(String id);
  Future<ReservationSessionModel> cancelUserTrainingSession(String id);
  Future<List<ReservationSessionModel>> getUserTrainingSessionHistory();
  Future<ReservationSessionModel> reservationNewTrainingSession(String id);
}