class CardData {
  String? prmoCode;
  String? startDate;
  String? packageId;
  String? status;
  String? amount;
  String? transactionTime;
  String? transactionReference;
  String? cartCurrency;
  String? shippingDetails;
  String? payment_method;


  CardData(
      {this.prmoCode,
      this.startDate,
      this.packageId,
      this.status,
      this.amount,
      this.transactionTime,
      this.transactionReference,
      this.cartCurrency,
      this.shippingDetails,
      this.payment_method});

  toJson(){
    return {
    'promo_code':prmoCode ?? '',
    'start_date':startDate,
    'amount':amount,
    'payment_method':payment_method,
    'paid_at':transactionTime,
    'currency':cartCurrency,
    'transaction_id':transactionReference,
    'description':shippingDetails,
    'status':status,
    'package_id':packageId
    };
  }
}