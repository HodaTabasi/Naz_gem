import 'dart:convert';

import 'package:naz_gem/core/network/app_setting.dart';

import 'package:naz_gem/features/subscrbtions/data/data_source/partner_remote_data_source.dart';


import 'package:http/http.dart' as http;
import 'package:naz_gem/features/subscrbtions/data/model/check_response_model.dart';

import '../../../../core/error/exceptions.dart';

class PartnerRemoteDataSourceImp extends PartnerRemoteDataSource {
  final http.Client client;

  PartnerRemoteDataSourceImp({required this.client});

  @override
  Future<CheckResponseModel> check(String promoCode) async {
    var map = {
      'promo_code':promoCode,
    };
    final response = await client.post(
        Uri.parse(baseUrl + checkPartner),
        headers: {"Content-Type": "application/json"},
        body:map
    );
    final  decodedJson = json.decode(response.body);
    if (response.statusCode == 200) {

      final CheckResponseModel responseModel  =
      CheckResponseModel.fromJson(decodedJson['data']);

      return responseModel;
    } else {
      throw ServerException();
    }
  }

}