import 'package:dartz/dartz.dart';
import 'package:naz_gem/features/auth/data/model/user_modle.dart';
import 'package:naz_gem/features/subscrbtions/data/model/check_response_model.dart';

abstract class PartnerRemoteDataSource {
  Future<CheckResponseModel> check(String promoCode);
}