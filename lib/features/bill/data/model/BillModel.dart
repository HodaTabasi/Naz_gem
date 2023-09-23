import 'package:naz_gem/features/bill/data/model/SubscriptionModel.dart';

import '../../domain/entities/bill.dart';

class BillModel extends Bill {
  BillModel(
      {id,
      invoiceNumber,
      clubTaxNumber,
      userIdNumber,
      amount,
      vat,
      paymentMethod,
      currency,
      paidAt,
      createdAt,
      subscription})
      : super(
            id: id,
            invoiceNumber: invoiceNumber,
            clubTaxNumber: clubTaxNumber,
            userIdNumber: userIdNumber,
            amount: amount,
            vat: vat,
            paymentMethod: paymentMethod,
            currency: currency,
            paidAt: paidAt,
            createdAt: createdAt,
            subscription: subscription);

  factory BillModel.fromJson(Map<String, dynamic> json){
    return BillModel( id : json['id'],
        invoiceNumber : json['invoice_number'],
        clubTaxNumber : json['club_tax_number'],
        userIdNumber : json['user_id_number'],
        amount : json['amount'],
        vat : json['vat'],
        paymentMethod : json['payment_method'],
        currency : json['currency'],
        paidAt : json['paid_at'],
        createdAt : json['created_at'],
        subscription : json['subscription'] != null
        ? SubscriptionModel.fromJson(json['subscription'])
        : null);
  }
}
