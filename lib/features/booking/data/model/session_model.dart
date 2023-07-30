import 'package:naz_gem/features/booking/domain/entities/session.dart';

class SessionModel extends Session {
  SessionModel(
      {id,
      name,
      date,
      startAt,
      endAt,
      capacity,
      availableSeats,
      status,
      statusName,
      sessionType,
      sessionTypeId,
      category,
      categoryId,
      instructor,
      instructorId,
      instructorIdentifier})
      : super(
            status: status,
            name: name,
            date: date,
            startAt: startAt,
            endAt: endAt,
            capacity: capacity,
            availableSeats: availableSeats,
            statusName: statusName,
            sessionType: sessionType,
            sessionTypeId: sessionTypeId,
            category: category,
            categoryId: categoryId,
            id: id,
            instructor: instructor,
            instructorId: instructorId,
            instructorIdentifier: instructorIdentifier);

factory SessionModel.fromJson(Map<String,dynamic> json){
  return SessionModel(
      id : json['id'],
      name : json['name'],
      date : json['date'],
      startAt : json['start_at'],
      endAt : json['end_at'],
      capacity : json['capacity'],
      availableSeats : json['available_seats'],
      status : json['status'],
      statusName : json['status_name'],
      sessionType : json['session_type'],
      sessionTypeId : json['session_type_id'],
      category : json['category'],
      categoryId : json['category_id'],
  instructor : json['instructor'],
  instructorId : json['instructor_id'],
  instructorIdentifier : json['instructor_identifier'],
  );
}
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['date'] = date;
    data['start_at'] = startAt;
    data['end_at'] = endAt;
    data['capacity'] = capacity;
    data['available_seats'] = availableSeats;
    data['status'] = status;
    data['status_name'] = statusName;
    data['session_type'] = sessionType;
    data['session_type_id'] = sessionTypeId;
    data['category'] = category;
    data['category_id'] = categoryId;
    data['instructor'] = instructor;
    data['instructor_id'] = instructorId;
    data['instructor_identifier'] = instructorIdentifier;
    return data;
  }

}
