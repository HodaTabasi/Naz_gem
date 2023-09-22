import 'package:dartz/dartz.dart';
import 'package:naz_gem/core/constants/api_response.dart';
import 'package:naz_gem/features/subscrbtions/domain/entities/card_data.dart';

import '../../../../core/error/failures.dart';
import '../entities/check_response.dart';

abstract class CheckRepo {
  Future<Either<Failure, CheckResponse>> getCheckPartner(promoCode,id);
  Future<Either<Failure, ApiResponse>> getCheckSubscription(promoCode,startDate, amount, packageId);
  Future<Either<Failure, ApiResponse>> sendBill(CardData data);
}