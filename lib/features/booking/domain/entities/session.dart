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

  @override
  String toString() {
    return 'Session{id: $id, name: $name, date: $date, startAt: $startAt, endAt: $endAt, capacity: $capacity, availableSeats: $availableSeats, status: $status, statusName: $statusName, sessionType: $sessionType, sessionTypeId: $sessionTypeId, category: $category, categoryId: $categoryId, instructor: $instructor, instructorId: $instructorId, instructorIdentifier: $instructorIdentifier}';
  }
}