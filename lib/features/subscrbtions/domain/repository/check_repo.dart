import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/check_response.dart';

abstract class CheckRepo {
  Future<Either<Failure, CheckResponse>> getCheck(promoCode);
}