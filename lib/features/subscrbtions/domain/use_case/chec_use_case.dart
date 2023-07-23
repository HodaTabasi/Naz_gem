import 'package:dartz/dartz.dart';
import 'package:naz_gem/features/subscrbtions/domain/entities/check_response.dart';

import '../../../../core/error/failures.dart';
import '../repository/check_repo.dart';

class CheckUseCase {
  final CheckRepo repository;

  CheckUseCase({required this.repository});

  Future<Either<Failure, CheckResponse>> call(String promoCode) async {
    return await repository.getCheck(promoCode);
  }
}