class CheckResponse {
  int? id;
  String? name;
  String? promoCode;
  int? packagePrice;
  num? packageDiscountAvg;
  num? priceAfterDiscount;
  num? partnerDiscountAvg;
  num? priceAfterPartnerDiscount;

  CheckResponse({this.id,
    this.name,
    this.promoCode,
    this.packagePrice,
    this.packageDiscountAvg,
    this.priceAfterDiscount,
    this.partnerDiscountAvg,
    this.priceAfterPartnerDiscount});
}