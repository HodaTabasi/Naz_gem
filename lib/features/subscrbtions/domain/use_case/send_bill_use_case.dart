import 'package:dartz/dartz.dart';
import 'package:naz_gem/core/constants/api_response.dart';
import 'package:naz_gem/features/subscrbtions/domain/entities/card_data.dart';
import 'package:naz_gem/features/subscrbtions/domain/entities/check_response.dart';

import '../../../../core/error/failures.dart';
import '../repository/check_repo.dart';

class SendBillUseCase {
  final CheckRepo repository;

  SendBillUseCase({required this.repository});

  Future<Either<Failure, ApiResponse>> call(CardData data) async {
    return await repository.sendBill(data);
  }
}