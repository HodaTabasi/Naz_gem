import 'package:dartz/dartz.dart';
import 'package:naz_gem/features/auth/domain/entities/user.dart';
import 'package:naz_gem/features/auth/domain/repository/auth_repo.dart';
import 'package:naz_gem/features/bill/domain/entities/bill.dart';

import '../../../../core/error/failures.dart';
import '../repository/bill_repo.dart';

class GetBillUseCase {
  BillRepo repository;

  GetBillUseCase({required this.repository});
  Future<Either<Failure, List<Bill>>> call() async {
    return await repository.getBill();
  }
}