import 'package:dartz/dartz.dart';
import 'package:naz_gem/features/auth/data/model/user_modle.dart';

abstract class PartnerRemoteDataSource {
  Future<Unit> check(String promoCode);
}