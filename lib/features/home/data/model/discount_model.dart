import 'package:naz_gem/features/home/domain/entities/discount.dart';

class DiscountModel extends Discount {
  DiscountModel(
      {id,
      name,
      ratio,
      startDate,
      endDate,
      status,
      packageId,
      createdAt,
      updatedAt})
      : super(
            id: id,
            status: status,
            name: name,
            endDate: endDate,
            startDate: startDate,
            ratio: ratio,
            packageId: packageId,
            createdAt: createdAt,
            updatedAt: updatedAt);

  DiscountModel.fromJson(Map<String, dynamic> json) {
      id = json['id'];
      name = json['name'];
      ratio = json['ratio'];
      startDate = json['start_date'];
      endDate = json['end_date'];
      status = json['status'];
      packageId = json['package_id'];
      createdAt = json['created_at'];
      updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = new Map<String, dynamic>();
      data['id'] = this.id;
      data['name'] = this.name;
      data['ratio'] = this.ratio;
      data['start_date'] = this.startDate;
      data['end_date'] = this.endDate;
      data['status'] = this.status;
      data['package_id'] = this.packageId;
      data['created_at'] = this.createdAt;
      data['updated_at'] = this.updatedAt;
      return data;
  }
}
