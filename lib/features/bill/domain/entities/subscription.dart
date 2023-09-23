import 'dart:convert';

import 'package:equatable/equatable.dart';

class Subscription  extends Equatable{
  int? id;
  String? packageType;
  String? packageDetails;
  int? totalDays;
  String? sessionsCount;
  String? startDate;
  String? subTotal;
  String? total;
  String? discounts;
  String? status;
  int? remainingDays;
  int? remainingSessions;
  int? packageId;


  Subscription(
      {this.id,
        this.packageType,
        this.packageDetails,
        this.totalDays,
        this.sessionsCount,
        this.startDate,
        this.subTotal,
        this.total,
        this.discounts,
        this.status,
        this.remainingDays,
        this.remainingSessions,
        this.packageId});

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    packageType,
    packageDetails,
    totalDays,
    sessionsCount,
    startDate,
    subTotal,
    total,
    discounts,
    status,
    remainingDays,
    remainingSessions,
    packageId
  ];

  @override
  String toString() {
    return 'Subscription{id: $id, packageType: $packageType, packageDetails: $packageDetails, totalDays: $totalDays, sessionsCount: $sessionsCount, startDate: $startDate, subTotal: $subTotal, total: $total, discounts: $discounts, status: $status, remainingDays: $remainingDays, remainingSessions: $remainingSessions, packageId: $packageId}';
  }

  toJsonDiscounts(){
    return json.decode(discounts?? '');
  }
}