import 'package:dartz/dartz.dart';
import 'package:naz_gem/core/constants/api_response.dart';
import 'package:naz_gem/features/auth/data/model/user_modle.dart';
import 'package:naz_gem/features/subscrbtions/data/model/check_response_model.dart';

import '../../domain/entities/card_data.dart';

abstract class PartnerRemoteDataSource {
  Future<CheckResponseModel> check(String promoCode,int id);
  Future<ApiResponse> checkSubscription(promoCode, startDate, amount, packageId);
  Future<ApiResponse> sendBill(CardData data);
}