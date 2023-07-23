import 'dart:convert';

import 'package:naz_gem/core/network/headers_data.dart';
import 'package:naz_gem/core/strings/failures.dart';
import 'package:naz_gem/features/home/data/data_source/package_data_source.dart';
import 'package:naz_gem/features/home/data/model/PackageModle.dart';
import 'package:http/http.dart' as http;
import 'package:naz_gem/features/home/data/model/gallery_model.dart';
import 'package:naz_gem/features/home/data/model/slider_model.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/app_setting.dart';

class PackageDataSourceImp extends PackageDataSource {
  final http.Client client;

  PackageDataSourceImp({required this.client});

  @override
  Future<List<PackageModel>> getAllPackages() async {
    final response = await client.get(
      Uri.parse(baseUrl + getAllPackagesApi),
      headers: headers,
    );
    final  decodedJson = json.decode(response.body);
    if (response.statusCode == 200) {
      final List<PackageModel> listModels = decodedJson['data']
          .map<PackageModel>((jsonPostModel) => PackageModel.fromJson(jsonPostModel))
          .toList();

      return listModels;
    } else {
      SERVER_FAILURE_MESSAGE = decodedJson['message'];
      throw ServerException();
    }
  }

  @override
  Future<PackageModel> getPackageDetails(String id) async {
    final response = await client.get(
      Uri.parse(baseUrl + packageDetails.replaceFirst('{id}', id)),
      headers: headers,
    );
    final  decodedJson = json.decode(response.body) ;
    if (response.statusCode == 200) {

      final PackageModel packageModel = PackageModel.fromJson(decodedJson['data']);

      return packageModel;
    } else {
      SERVER_FAILURE_MESSAGE = decodedJson['message'];
      throw ServerException();
    }
  }

  @override
  Future<List<GalleryModel>> getGalleries() async {
    final response = await client.get(
      Uri.parse(baseUrl + getGalleriesApi),
      headers: headers,
    );
    final  decodedJson = json.decode(response.body);
    if (response.statusCode == 200) {
      final List<GalleryModel> listModels = decodedJson['data']
          .map<GalleryModel>((jsonPostModel) => GalleryModel.fromJson(jsonPostModel))
          .toList();

      return listModels;
    } else {
      SERVER_FAILURE_MESSAGE = decodedJson['message'];
      throw ServerException();
    }
  }

  @override
  Future<List<SliderModel>> getSliders() async {
    final response = await client.get(
      Uri.parse(baseUrl + getSlidersApi),
      headers: headers,
    );
    final  decodedJson = json.decode(response.body);
    if (response.statusCode == 200) {
      final List<SliderModel> listModels = decodedJson['data']
          .map<SliderModel>((jsonPostModel) => SliderModel.fromJson(jsonPostModel))
          .toList();

      return listModels;
    } else {
      SERVER_FAILURE_MESSAGE = decodedJson['message'];
      throw ServerException();
    }
  }

}