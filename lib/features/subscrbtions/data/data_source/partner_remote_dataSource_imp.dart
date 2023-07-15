import 'package:dartz/dartz.dart';
import 'package:naz_gem/core/network/app_setting.dart';

import 'package:naz_gem/features/auth/data/model/user_modle.dart';
import 'package:naz_gem/features/subscrbtions/data/data_source/partner_remote_data_source.dart';


import 'package:http/http.dart' as http;

class PartnerRemoteDataSourceImp extends PartnerRemoteDataSource {
  final http.Client client;

  PartnerRemoteDataSourceImp({required this.client});

  @override
  Future<Unit> check(String promoCode) async {
    var map = {
      'promo_code':promoCode,
    };
    final response = await client.post(
        Uri.parse(baseUrl + checkPartner),
        headers: {"Content-Type": "application/json"},
        body:map
    );
    throw UnimplementedError();
  }

}