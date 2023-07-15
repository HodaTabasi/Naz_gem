import 'package:dartz/dartz.dart';
import 'package:naz_gem/core/network/app_setting.dart';

import 'package:naz_gem/features/auth/data/model/user_modle.dart';

import 'auth_remote_data_source.dart';

import 'package:http/http.dart' as http;

class AuthRemoteDataSourceImp extends AuthRemoteDataSource {
  final http.Client client;

  AuthRemoteDataSourceImp({required this.client});

  @override
  Future<UserModel> createAccount(UserModel userModel) async {
    var map = {
      "first_name":'',
      "last_name":'',
      "phone":'',
      "email":'',
    };

    final response = await client.post(
      Uri.parse(baseUrl + createUser),
      headers: {"Content-Type": "application/json"},
       body:map
    );
    throw UnimplementedError();
  }

  @override
  Future<UserModel> getUser(String userId) async {
    final response = await client.get(
        Uri.parse(baseUrl + getProfile),
        headers: {"Content-Type": "application/json"},
    );
    throw UnimplementedError();
  }

  @override
  Future<UserModel> login(String phone, String otp) async {
    var map = {
      'phone':phone,
      'otp_code':otp
    };
    final response = await client.post(
        Uri.parse(baseUrl + loginUser),
        headers: {"Content-Type": "application/json"},
        body:map
    );
    throw UnimplementedError();
  }

  // @override
  // Future<Unit> logout() async {
  //   final response = await client.get(
  //     Uri.parse(baseUrl + logoutUser),
  //     headers: {"Content-Type": "application/json"},
  //   );
  //   throw UnimplementedError();
  // }

  @override
  Future<Unit> sendOTP(String phoneNumber) async {
    var map = {
      'phone': ''
    };
    final response = await client.post(
        Uri.parse(baseUrl + sendOTPApi),
        headers: {"Content-Type": "application/json"},
        body:map
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