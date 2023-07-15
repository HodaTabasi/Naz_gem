import 'package:naz_gem/features/home/data/model/PackageModle.dart';

abstract class PackageDataSource {
  Future<List<PackageModel>> getAllPackages();
  Future<PackageModel> getPackageDetails(String id);
}