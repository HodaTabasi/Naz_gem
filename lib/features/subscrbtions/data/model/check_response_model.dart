import 'package:naz_gem/features/subscrbtions/domain/entities/check_response.dart';

class CheckResponseModel extends CheckResponse {
  CheckResponseModel(
      {id,
      name,
      promoCode,
      packagePrice,
      packageDiscountAvg,
      priceAfterDiscount,
      partnerDiscountAvg,
      priceAfterPartnerDiscount})
      : super(
            id: id,
            name: name,
            promoCode: promoCode,
            packagePrice: packagePrice,
            packageDiscountAvg: packageDiscountAvg,
            priceAfterDiscount: priceAfterDiscount,
            partnerDiscountAvg: partnerDiscountAvg,
            priceAfterPartnerDiscount: priceAfterPartnerDiscount);

  factory CheckResponseModel.fromJson(Map<String, dynamic> json) {
    return CheckResponseModel(
      id: json['id'],
      name: json['name'],
      promoCode: json['promo_code'],
      packagePrice: json['package_price'],
      packageDiscountAvg: json['package_discount_avg'],
      priceAfterDiscount: json['price_after_discount'],
      partnerDiscountAvg: json['partner_discount_avg'],
      priceAfterPartnerDiscount: json['price_after_partner_discount'],
    );
  }
}
