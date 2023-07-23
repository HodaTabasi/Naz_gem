import 'package:naz_gem/features/booking/data/model/session_model.dart';
import 'package:naz_gem/features/booking/domain/entities/session.dart';

import '../../domain/entities/reservation_session.dart';

class ReservationSessionModel extends ReservationSession {
  ReservationSessionModel(
      {id,
      status,
      traineeId,
      trainingSessionId,
      createdAt,
      updatedAt,
      trainingSession})
      : super(
            id: id,
            status: status,
            traineeId: traineeId,
            trainingSession: trainingSession,
            trainingSessionId: trainingSessionId,
            updatedAt: updatedAt,
            createdAt: createdAt);

  ReservationSessionModel.fromJson(Map<String, dynamic> json) {
      id = json['id'];
      status = json['status'];
      traineeId = json['trainee_id'];
      trainingSessionId = json['training_session_id'];
      createdAt = json['created_at'];
      updatedAt = json['updated_at'];
      trainingSession = json['training_session'] != null
          ?  SessionModel.fromJson(json['training_session'])
          : null;
  }

  Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = new Map<String, dynamic>();
      data['id'] = this.id;
      data['status'] = this.status;
      data['trainee_id'] = this.traineeId;
      data['training_session_id'] = this.trainingSessionId;
      data['created_at'] = this.createdAt;
      data['updated_at'] = this.updatedAt;
      // if (this.trainingSession != null) {
      //     data['training_session'] = this.trainingSession!.toJson() as SessionModel;
      // }
      return data;
  }
}
