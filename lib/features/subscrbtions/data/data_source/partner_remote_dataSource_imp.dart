import 'dart:convert';

import 'package:naz_gem/core/network/app_setting.dart';
import 'package:naz_gem/core/network/headers_data.dart';

import 'package:naz_gem/features/subscrbtions/data/data_source/partner_remote_data_source.dart';


import 'package:http/http.dart' as http;
import 'package:naz_gem/features/subscrbtions/data/model/check_response_model.dart';
import 'package:naz_gem/features/subscrbtions/domain/entities/card_data.dart';

import '../../../../core/constants/api_response.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/strings/failures.dart';

class PartnerRemoteDataSourceImp extends PartnerRemoteDataSource {
  final http.Client client;

  PartnerRemoteDataSourceImp({required this.client});

  @override
  Future<CheckResponseModel> check(String promoCode,int id) async {
    var map = {
      'promo_code':promoCode,
      'package_id':'$id',
    };
    final response = await client.post(
        Uri.parse(baseUrl + checkPartner),
        headers: headers,
        body:map
    );
    final  decodedJson = json.decode(response.body);
    if (response.statusCode == 200) {
      final CheckResponseModel responseModel  =
      CheckResponseModel.fromJson(decodedJson['data']);
      return responseModel;
    } else {
      SERVER_FAILURE_MESSAGE = decodedJson['message'];
      throw ServerException();
    }
  }

  @override
  Future<ApiResponse> checkSubscription(promoCode, startDate, amount, packageId) async {
    var map = {
      'promo_code':'$promoCode',
      'start_date':'$startDate',
      'amount':'$amount',
      'package_id':'$packageId'
    };
    print( {
      'promo_code':'$promoCode',
      'start_date':'$startDate',
      'amount':'$amount',
      'package_id':'$packageId'
    });
    final response = await client.post(
        Uri.parse(baseUrl + checkMySubscription),
        headers: headers,
        body:map
    );
    final  decodedJson = json.decode(response.body);
    if (response.statusCode == 200) {
      final ApiResponse responseModel  =
      ApiResponse.fromJson(decodedJson);
      return responseModel;
    } else {
      SERVER_FAILURE_MESSAGE = decodedJson['message'];
      throw ServerException();
    }
  }

  @override
  Future<ApiResponse> sendBill(CardData data) async {
    //print(data.toJson());
    final response = await client.post(
        Uri.parse(baseUrl + sentBill),
        headers: headers,
        body:data.toJson()
    );
    print("object ${response.statusCode}");
    print("object ${response.body}");
    final  decodedJson = json.decode(response.body);
    if (response.statusCode == 200) {
      final ApiResponse responseModel  =
      ApiResponse.fromJson(decodedJson);
      return responseModel;
    } else {
      SERVER_FAILURE_MESSAGE = decodedJson['message'];
      throw ServerException();
    }
  }

}