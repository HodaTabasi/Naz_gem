import 'package:naz_gem/features/subscrbtions/domain/entities/check_response.dart';

class CheckResponseModel extends CheckResponse {
  CheckResponseModel(
      {id, name, promoCode, discountAvg, status, createdAt, updatedAt})
      : super(
            id: id,
            name: name,
            promoCode: promoCode,
            discountAvg: discountAvg,
            status: status,
            createdAt: createdAt,
            updatedAt: updatedAt);

  factory CheckResponseModel.fromJson(Map<String, dynamic> json) {
    return CheckResponseModel(
      id: json['id'],
      name: json['name'],
      promoCode: json['promo_code'],
      discountAvg: json['discount_avg'],
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
