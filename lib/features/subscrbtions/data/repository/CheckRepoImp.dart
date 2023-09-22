import 'package:dartz/dartz.dart';
import 'package:naz_gem/core/constants/api_response.dart';
import 'package:naz_gem/core/error/failures.dart';
import 'package:naz_gem/features/subscrbtions/domain/entities/card_data.dart';
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
  Future<Either<Failure, CheckResponse>> getCheckPartner(promoCode,id) async {
    if (await networkInfo.isConnected) {
      try {
        CheckResponse checkResponse = await partnerRemoteDataSource.check(promoCode,id);
        return Right(checkResponse);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, ApiResponse>> getCheckSubscription(promoCode, startDate, amount, packageId) async {
    if (await networkInfo.isConnected) {
      try {
        ApiResponse apiResponse = await partnerRemoteDataSource.checkSubscription(promoCode, startDate, amount, packageId);
        return Right(apiResponse);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, ApiResponse>> sendBill(CardData data) async {
    if (await networkInfo.isConnected) {
      try {
        ApiResponse apiResponse = await partnerRemoteDataSource.sendBill(data);
        return Right(apiResponse);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

}