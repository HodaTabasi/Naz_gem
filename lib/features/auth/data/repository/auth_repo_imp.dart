import 'package:dartz/dartz.dart';

import 'package:naz_gem/core/constants/api_response.dart';

import 'package:naz_gem/core/error/failures.dart';
import 'package:naz_gem/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:naz_gem/features/auth/data/model/user_modle.dart';
import 'package:naz_gem/features/auth/domain/entities/user.dart';


import '../../../../core/error/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repository/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final AuthRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;


  AuthRepoImpl({required this.remoteDataSource,required this.networkInfo});

  @override
  Future<Either<Failure, User>> createAccount(User userModel) async {
    UserModel user = UserModel(phone: userModel.phone,email: userModel.email,lastName: userModel.lastName,firstName: userModel.firstName);
    return _getMessage(()=>remoteDataSource.createAccount(user));
  }

  @override
  Future<Either<Failure, User>> login(String phone, String otp) async {
    return _getMessage(()=>remoteDataSource.login(phone,otp));
  }

  @override
  Future<Either<Failure, ApiResponse>> sendOTP(String phoneNumber) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = await remoteDataSource.sendOTP(phoneNumber);
        return Right(remotePosts);
      } on ServerException {
        return Left(ServerFailure());
      }
    }else {
      return Left(OfflineFailure());
    }
  }


  Future<Either<Failure, User>> _getMessage(
      Function loginOrCreate) async {
    if (await networkInfo.isConnected) {
      try {
       final user =  await loginOrCreate();
        return Right(user);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

}