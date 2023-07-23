import 'package:dartz/dartz.dart';
import 'package:naz_gem/core/error/failures.dart';
import 'package:naz_gem/features/subscrbtions/domain/entities/check_response.dart';
import 'package:naz_gem/features/subscrbtions/domain/repository/check_repo.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../data_source/partner_remote_data_source.dart';

class CheckRepoImp extends CheckRepo {
  NetworkInfo networkInfo;
  PartnerRemoteDataSource partnerRemoteDataSource;


  CheckRepoImp({required this.networkInfo, required this.partnerRemoteDataSource});

  @override
  Future<Either<Failure, CheckResponse>> getCheck(promoCode) async {
    if (await networkInfo.isConnected) {
      try {
        CheckResponse checkResponse = await partnerRemoteDataSource.check(promoCode);
        return Right(checkResponse);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

}