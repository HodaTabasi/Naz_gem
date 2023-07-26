import 'package:naz_gem/features/booking/domain/entities/session.dart';

class ReservationSession {
int? id;
int? status;
int? traineeId;
int? trainingSessionId;
String? createdAt;
String? updatedAt;
Session? trainingSession;

ReservationSession(
    {this.id,
      this.status,
      this.traineeId,
      this.trainingSessionId,
      this.createdAt,
      this.updatedAt,
      this.trainingSession});

@override
  String toString() {
    return 'ReservationSession{id: $id, status: $status, traineeId: $traineeId, trainingSessionId: $trainingSessionId, createdAt: $createdAt, updatedAt: $updatedAt, trainingSession: $trainingSession}';
}
}