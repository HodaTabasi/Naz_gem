import 'package:dartz/dartz.dart';
import 'package:naz_gem/core/error/failures.dart';
import 'package:naz_gem/features/auth/domain/entities/user.dart';
import 'package:naz_gem/features/profile/data/data_source/profile_remote_data_source.dart';
import 'package:naz_gem/features/profile/domain/repository/profile_repo.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../../../auth/data/model/user_modle.dart';

class ProfileRepoImp extends ProfileRepo {
  final ProfileRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  ProfileRepoImp({required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, User>> getUser() async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = await remoteDataSource.getUser();
        return Right(remotePosts);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, User>> updateUser(User userModel) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = await remoteDataSource.updateUser(user(userModel));
        return Right(remotePosts);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  UserModel user(userModel) {
    return UserModel(
        phone: userModel.phone,
        email: userModel.email,
        lastName: userModel.lastName,
        firstName: userModel.firstName,
        profileImage: userModel.profileImage,
        length: userModel.length,
        bloodType: userModel.bloodType,
        birthdate: userModel.birthdate);}
}
