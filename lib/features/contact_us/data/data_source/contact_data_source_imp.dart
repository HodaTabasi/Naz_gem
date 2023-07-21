import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:naz_gem/core/network/app_setting.dart';
import 'package:naz_gem/core/network/headers_data.dart';

import 'package:naz_gem/features/contact_us/data/model/ContactModel.dart';

import '../../../../core/error/exceptions.dart';
import 'contact_data_source.dart';

import 'package:http/http.dart' as http;

class ContactDataSourceImp extends ContactDataSource {
  final http.Client client;


  ContactDataSourceImp({required this.client});

  @override
  Future<Unit> Logout() async {
    final response = await client.get(
      Uri.parse(baseUrl + logoutUser),
      headers: headers,
    );

    if (response.statusCode == 200) {

      return  Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<ContactModel>> getContact() async {
    final response = await client.get(
      Uri.parse(baseUrl + contactApi),
      headers: headers,
    );

    if (response.statusCode == 200) {
      final  decodedJson = json.decode(response.body);
      final List<ContactModel> postModels = decodedJson['data']
          .map<ContactModel>((jsonPostModel) => ContactModel.fromJson(jsonPostModel))
          .toList();

      return postModels;
    } else {
      throw ServerException();
    }
  }

}