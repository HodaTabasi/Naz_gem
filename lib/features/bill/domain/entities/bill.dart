import 'package:equatable/equatable.dart';
import 'package:naz_gem/features/bill/domain/entities/subscription.dart';

class Bill extends Equatable{
  int? id;
  String? invoiceNumber;
  String? clubTaxNumber;
  String? userIdNumber;
  String? amount;
  String? vat;
  String? paymentMethod;
  String? currency;
  String? paidAt;
  String? createdAt;
  Subscription? subscription;


  Bill(
      {this.id,
        this.invoiceNumber,
        this.clubTaxNumber,
        this.userIdNumber,
        this.amount,
        this.vat,
        this.paymentMethod,
        this.currency,
        this.paidAt,
        this.createdAt,
        this.subscription});

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    invoiceNumber,
    clubTaxNumber,
    userIdNumber,
    amount,
    vat,
    paymentMethod,
    currency,
    paidAt,
    createdAt,
    subscription];

  @override
  String toString() {
    return 'Bill{id: $id, invoiceNumber: $invoiceNumber, clubTaxNumber: $clubTaxNumber, userIdNumber: $userIdNumber, amount: $amount, vat: $vat, paymentMethod: $paymentMethod, currency: $currency, paidAt: $paidAt, createdAt: $createdAt, subscription: $subscription}';
  }
}