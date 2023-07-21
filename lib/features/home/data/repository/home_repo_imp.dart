import 'package:dartz/dartz.dart';
import 'package:naz_gem/core/error/failures.dart';
import 'package:naz_gem/features/home/domain/repository/homeRepo.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/gallery.dart';
import '../../domain/entities/packages.dart';
import '../../domain/entities/sliders.dart';
import '../data_source/package_data_source.dart';

class HomeRepoImp extends  HomeRepo{

  PackageDataSource dataSource;
  final NetworkInfo networkInfo;


  HomeRepoImp({required this.dataSource, required this.networkInfo});

  @override
  Future<Either<Failure, List<Package>>> getAllPackages() async {
    if (await networkInfo.isConnected) {
      try {
        final remotePackages = await dataSource.getAllPackages();
        return Right(remotePackages);
      } on ServerException {
        return Left(ServerFailure());
      }
    }else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, List<Gallery>>> getGalleries() async {
    if (await networkInfo.isConnected) {
      try {
        final remotePackages = await dataSource.getGalleries();
        return Right(remotePackages);
      } on ServerException {
        return Left(ServerFailure());
      }
    }else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Package>> getPackageDetails(String id) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePackages = await dataSource.getPackageDetails(id);
        return Right(remotePackages);
      } on ServerException {
        return Left(ServerFailure());
      }
    }else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, List<MySlider>>> getSliders() async {
    if (await networkInfo.isConnected) {
      try {
        final remotePackages = await dataSource.getSliders();
        return Right(remotePackages);
      } on ServerException {
        return Left(ServerFailure());
      }
    }else {
      return Left(OfflineFailure());
    }
  }

}