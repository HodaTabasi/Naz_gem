import 'package:dartz/dartz.dart';
import 'package:naz_gem/core/constants/api_response.dart';
import 'package:naz_gem/features/subscrbtions/domain/entities/check_response.dart';

import '../../../../core/error/failures.dart';
import '../repository/check_repo.dart';

class CheckSubscriptionUseCase {
  final CheckRepo repository;

  CheckSubscriptionUseCase({required this.repository});

  Future<Either<Failure, ApiResponse>> call(promoCode,startDate, amount, packageId) async {
    return await repository.getCheckSubscription(promoCode,startDate, amount, packageId);
  }
}