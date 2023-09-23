import 'package:dartz/dartz.dart';

import 'package:naz_gem/core/constants/api_response.dart';

import 'package:naz_gem/core/error/failures.dart';
import 'package:naz_gem/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:naz_gem/features/auth/data/model/user_modle.dart';
import 'package:naz_gem/features/auth/domain/entities/user.dart';
import 'package:naz_gem/features/bill/domain/entities/bill.dart';


import '../../../../core/error/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repository/bill_repo.dart';
import '../data_source/get_bill_remote_data_source.dart';

class BillRepoImpl extends BillRepo {
  final BillRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;


  BillRepoImpl({required this.remoteDataSource,required this.networkInfo});
  @override
  Future<Either<Failure, List<Bill>>> getBill() async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = await remoteDataSource.getBill();
        return Right(remotePosts);
      } on ServerException {
        return Left(ServerFailure());
      }
    }else {
      return Left(OfflineFailure());
    }
  }

}