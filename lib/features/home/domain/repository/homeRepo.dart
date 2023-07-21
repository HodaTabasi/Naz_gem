import 'package:dartz/dartz.dart';
import 'package:naz_gem/features/home/data/model/PackageModle.dart';

import '../../../../core/error/failures.dart';
import '../entities/gallery.dart';
import '../entities/packages.dart';
import '../entities/sliders.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<Package>>> getAllPackages();
  Future<Either<Failure, Package>> getPackageDetails(String id);
  Future<Either<Failure, List<Gallery>>> getGalleries();
  Future<Either<Failure, List<MySlider>>> getSliders();
}