import 'dart:convert';

import 'package:naz_gem/core/network/app_setting.dart';


import 'package:naz_gem/features/bill/data/model/BillModel.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/headers_data.dart';
import '../../../../core/strings/failures.dart';


import 'package:http/http.dart' as http;

import 'get_bill_remote_data_source.dart';

class BillRemoteDataSourceImp extends BillRemoteDataSource {
  final http.Client client;

  BillRemoteDataSourceImp({required this.client});

  @override
  Future<List<BillModel>> getBill() async {
    final response = await client.get(
      Uri.parse('$baseUrl$sentBill'),
      headers: headers,
    );
    final  decodedJson = json.decode(response.body);
    if (response.statusCode == 200) {
      // GetStorage().write('lastPage',decodedJson['meta']['last_page']);
      final List<BillModel> listModels = decodedJson['data']
          .map<BillModel>((jsonPostModel) => BillModel.fromJson(jsonPostModel))
          .toList();

      return listModels;
    } else {
      SERVER_FAILURE_MESSAGE = decodedJson['message'];
      throw ServerException();
    }
  }


}