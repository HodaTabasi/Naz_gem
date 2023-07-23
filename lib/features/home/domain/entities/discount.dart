class Discount {
  int? id;
  String? name;
  int? ratio;
  String? startDate;
  String? endDate;
  int? status;
  int? packageId;
  String? createdAt;
  String? updatedAt;

  Discount(
      {this.id,
        this.name,
        this.ratio,
        this.startDate,
        this.endDate,
        this.status,
        this.packageId,
        this.createdAt,
        this.updatedAt});
}