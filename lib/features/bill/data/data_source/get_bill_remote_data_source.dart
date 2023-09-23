import 'package:dartz/dartz.dart';
import 'package:naz_gem/features/auth/data/model/user_modle.dart';
import 'package:naz_gem/features/bill/data/model/BillModel.dart';

import '../../../../core/constants/api_response.dart';

abstract class BillRemoteDataSource {
  Future<List<BillModel>> getBill();
}