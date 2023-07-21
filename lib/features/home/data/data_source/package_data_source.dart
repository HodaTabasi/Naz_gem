import 'package:naz_gem/features/home/data/model/PackageModle.dart';
import 'package:naz_gem/features/home/data/model/gallery_model.dart';
import 'package:naz_gem/features/home/data/model/slider_model.dart';

abstract class PackageDataSource {
  Future<List<PackageModel>> getAllPackages();
  Future<PackageModel> getPackageDetails(String id);
  Future<List<GalleryModel>> getGalleries();
  Future<List<SliderModel>> getSliders();
}