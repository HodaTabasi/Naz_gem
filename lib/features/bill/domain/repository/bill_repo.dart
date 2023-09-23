import 'package:dartz/dartz.dart';
import 'package:naz_gem/features/auth/domain/entities/user.dart';
import 'package:naz_gem/features/bill/data/model/BillModel.dart';

import '../../../../core/constants/api_response.dart';
import '../../../../core/error/failures.dart';
import '../entities/bill.dart';

abstract class BillRepo {
  Future<Either<Failure,List<Bill>>> getBill();
}