import 'package:naz_gem/features/home/data/data_source/package_data_source.dart';
import 'package:naz_gem/features/home/data/model/PackageModle.dart';
import 'package:http/http.dart' as http;

import '../../../../core/network/app_setting.dart';

class PackageDataSourceImp extends PackageDataSource {
  final http.Client client;

  PackageDataSourceImp(this.client);

  @override
  Future<List<PackageModel>> getAllPackages() async {
    final response = await client.get(
      Uri.parse(baseUrl + getAllPackagesApi),
      headers: {"Content-Type": "application/json"},
    );
    throw UnimplementedError();
  }

  @override
  Future<PackageModel> getPackageDetails(String id) async {
    final response = await client.get(
      Uri.parse(baseUrl + packageDetails.replaceFirst('{id}', id)),
      headers: {"Content-Type": "application/json"},
    );
    throw UnimplementedError();
  }

}