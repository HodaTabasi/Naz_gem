import 'package:dartz/dartz.dart';
import 'package:naz_gem/core/network/app_setting.dart';

import 'package:naz_gem/features/profile/data/data_source/profile_remote_data_source.dart';

import 'package:http/http.dart' as http;
import 'package:naz_gem/features/profile/data/model/user_modle.dart';

class ProfileRemoteDataSourceImp extends ProfileRemoteDataSource {
  final http.Client client;

  ProfileRemoteDataSourceImp({required this.client});

  @override
  Future<UserModel> getUser(String userId) async {
    final response = await client.get(
        Uri.parse(baseUrl + getProfile),
        headers: {"Content-Type": "application/json"},
    );
    throw UnimplementedError();
  }

  @override
  Future<Unit> updateUser(UserModel userModel) async {
   var map = {
    'first_name':'',
    'last_name':'',
    'phone':'',
    'email':'',
    'birthdate':'',
    'length':'',
    'blood_type':''
    };
    final response = await client.post(
        Uri.parse(baseUrl + updateProfile),
        headers: {"Content-Type": "application/json"},
        body:map
    );
    throw UnimplementedError();
  }

}