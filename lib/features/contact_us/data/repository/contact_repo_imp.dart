import 'package:dartz/dartz.dart';
import 'package:naz_gem/core/error/failures.dart';
import 'package:naz_gem/core/network/network_info.dart';
import 'package:naz_gem/features/contact_us/data/data_source/contact_data_source.dart';
import 'package:naz_gem/features/contact_us/domain/entities/contact.dart';
import 'package:naz_gem/features/contact_us/domain/repository/contact_repo.dart';

import '../../../../core/error/exceptions.dart';

class ContactRepoImp extends ContactRepo {
  ContactDataSource contactDataSource;
  NetworkInfo networkInfo;

  ContactRepoImp({required this.contactDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, List<Contact>>> getContact() async {
    if (await networkInfo.isConnected) {
      try {
        final contactList = await contactDataSource.getContact();
        return Right(contactList);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    if (await networkInfo.isConnected) {
      try {
        await contactDataSource.Logout();
        return Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
