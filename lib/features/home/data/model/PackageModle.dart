import 'package:naz_gem/features/home/data/model/discount_model.dart';
import 'package:naz_gem/features/home/domain/entities/packages.dart';

class PackageModel extends Package {
  PackageModel(
      {id,
      name,
      price,
      durationTypeName,
      details,
      categoryId,
      category,
      discounts})
      : super(
            id: id,
            category: category,
            categoryId: categoryId,
            details: details,
            discounts: discounts,
            durationTypeName: durationTypeName,
            name: name,
            price: price);

  factory PackageModel.fromJson(Map<String, dynamic> json) {
    PackageModel model = PackageModel();
    model.id = json['id'];
    model.name = json['name'];
    model.price = json['price'];
    model.durationTypeName = json['duration_type_name'];
    model.details = json['details'];
    model.categoryId = json['category_id'];
    model.category = json['category'];
    if (json['discounts'] != null) {
      model.discounts = <DiscountModel>[];
      json['discounts'].forEach((v) {
        model.discounts!.add(DiscountModel.fromJson(v));
      });
    }
    return model;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['duration_type_name'] = this.durationTypeName;
    data['details'] = this.details;
    data['category_id'] = this.categoryId;
    data['category'] = this.category;
    if (this.discounts != null) {
      data['discounts'] = this.discounts!.map((v) => v).toList();
    }
    return data;
  }
}
