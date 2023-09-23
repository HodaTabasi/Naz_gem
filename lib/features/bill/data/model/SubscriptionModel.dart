import 'package:naz_gem/features/bill/domain/entities/subscription.dart';

class SubscriptionModel extends Subscription {

  SubscriptionModel(
      {id,
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
        endDate,
        packageId})
      : super(
      id:id,
      packageType:packageType,
      packageDetails:packageDetails,
      totalDays:totalDays,
      sessionsCount:sessionsCount,
      startDate:startDate,
      subTotal:subTotal,
      total:total,
      discounts:discounts,
      status:status,
      remainingDays:remainingDays,
      remainingSessions:remainingSessions,
      endDate:endDate,
      packageId:packageId);

  factory SubscriptionModel.fromJson(Map<String, dynamic> json){
    return SubscriptionModel(
        id : json['id'],
        packageType : json['package_type'],
        packageDetails : json['package_details'],
        totalDays : json['total_days'],
        sessionsCount : json['sessions_count'],
        startDate : json['start_date'],
        subTotal : json['sub_total'],
        total : json['total'],
        discounts : json['discounts'],
        status : json['status'],
      endDate : json['end_date'],
        remainingDays : json['remaining_days'],
        remainingSessions : json['remaining_sessions'],
        packageId : json['package_id'],
    );
  }
}