import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:naz_gem/core/network/app_setting.dart';

import 'package:naz_gem/features/auth/data/model/user_modle.dart';

import '../../../../core/constants/api_response.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/strings/failures.dart';
import 'auth_remote_data_source.dart';

import 'package:http/http.dart' as http;

class AuthRemoteDataSourceImp extends AuthRemoteDataSource {
  final http.Client client;

  AuthRemoteDataSourceImp({required this.client});

  @override
  Future<UserModel> createAccount(UserModel userModel) async {
    var map = {
      "first_name":userModel.firstName,
      "last_name":userModel.lastName,
      "phone":userModel.phone,
      "email":userModel.email,
    };

    print(map);

    final response = await client.post(
      Uri.parse(baseUrl + createUser),
      // headers: {"Content-Type": "application/json"},
       body:map
    );
    var  decodedJson = json.decode(response.body);
    print(response.body);
    if (response.statusCode == 201) {
      GetStorage().write('otp', decodedJson['otp_code']);
      return UserModel.fromJson(decodedJson['user']);
    } else {
      SERVER_FAILURE_MESSAGE = decodedJson['message'] ;
      throw ServerException();
    }
  }

  @override
  Future<UserModel> login(String phone, String otp) async {
    var map = {
      'phone':phone,
      'otp_code':otp
    };
    final response = await client.post(
        Uri.parse(baseUrl + loginUser),
        // headers: {"Content-Type": "application/json"},
        body:map
    );
    var  decodedJson = json.decode(response.body);
    if (response.statusCode == 200) {
      GetStorage().write('token', decodedJson['token']);
      return UserModel.fromJson(decodedJson['user']);
    } else {
      SERVER_FAILURE_MESSAGE = decodedJson['message'] ;
      throw ServerException();
    }
  }

  @override
  Future<ApiResponse> sendOTP(String phoneNumber) async {
    var map = {
      'phone': phoneNumber
    };
    final response = await client.post(
        Uri.parse(baseUrl + sendOTPApi),
        // headers: {"Content-Type": "application/json"},
        body:map
    );
    var  decodedJson = json.decode(response.body);
    if (response.statusCode == 200) {
      GetStorage().write('otp', decodedJson['otp_code']);
      return ApiResponse.fromJson(decodedJson);
    } else {
      SERVER_FAILURE_MESSAGE = decodedJson['message'] ;
      throw ServerException();
    }
  }
}