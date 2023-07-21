import 'package:dartz/dartz.dart';
import 'package:naz_gem/features/home/data/model/PackageModle.dart';
import 'package:naz_gem/features/home/domain/repository/homeRepo.dart';

import '../../../../core/error/failures.dart';
import '../entities/packages.dart';

class GetPackageUseCase {
  final HomeRepo repository;

  GetPackageUseCase({required this.repository});

  Future<Either<Failure, Package>> call(String id) async {
    return await repository.getPackageDetails(id);
  }
}
