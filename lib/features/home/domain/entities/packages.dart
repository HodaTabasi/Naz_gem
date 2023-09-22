import 'package:equatable/equatable.dart';
import 'package:naz_gem/features/home/domain/entities/discount.dart';

class Package extends Equatable {
  int? id;
  String? name;
  String? price;
  int? sessionsCount;
  int? duration;
  String? durationTypeName;
  String? details;
  int? categoryId;
  String? category;
  List<Discount>? discounts;

  Package(
      {this.id,
        this.name,
        this.price,
        this.durationTypeName,
        this.details,
        this.categoryId,
        this.category,
        this.duration,
        this.sessionsCount,
        this.discounts});

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
        price,
        durationTypeName,
        details,
        categoryId,
        category,
        discounts
      ];

  @override
  String toString() {
    return 'Package{id: $id, name: $name, price: $price, sessionsCount: $sessionsCount, duration: $duration, durationTypeName: $durationTypeName, details: $details, categoryId: $categoryId, category: $category, discounts: $discounts}';
  }
}