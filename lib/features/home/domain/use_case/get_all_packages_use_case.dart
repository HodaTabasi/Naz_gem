import 'package:dartz/dartz.dart';
import 'package:naz_gem/features/home/data/model/PackageModle.dart';
import 'package:naz_gem/features/home/domain/repository/homeRepo.dart';

import '../../../../core/error/failures.dart';
import '../entities/packages.dart';

class GetPackagesUseCase {
  final HomeRepo repository;

  GetPackagesUseCase({required this.repository});

  Future<Either<Failure, List<Package>>> call() async {
    return await repository.getAllPackages();
  }
}
