class Session {
  int? id;
  String? name;
  String? date;
  String? startAt;
  String? endAt;
  int? capacity;
  int? availableSeats;
  String? status;
  String? statusName;
  String? sessionType;
  int? sessionTypeId;
  String? category;
  int? categoryId;
  String? instructor;
  int? instructorId;
  String? instructorIdentifier;

  Session(
      {this.id,
        this.name,
        this.date,
        this.startAt,
        this.endAt,
        this.capacity,
        this.availableSeats,
        this.status,
        this.statusName,
        this.sessionType,
        this.sessionTypeId,
        this.category,
        this.categoryId,
        this.instructor,
        this.instructorId,
        this.instructorIdentifier});
}