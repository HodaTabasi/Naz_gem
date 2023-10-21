import 'dart:convert';
import 'dart:io';

import 'package:get_storage/get_storage.dart';
import 'package:naz_gem/core/network/app_setting.dart';

import 'package:naz_gem/features/profile/data/data_source/profile_remote_data_source.dart';

import 'package:http/http.dart' as http;

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/headers_data.dart';
import '../../../../core/strings/failures.dart';
import '../../../auth/data/model/user_modle.dart';

class ProfileRemoteDataSourceImp extends ProfileRemoteDataSource {
  final http.Client client;

  ProfileRemoteDataSourceImp({required this.client});

  @override
  Future<UserModel> getUser() async {
    final response =
        await client.get(Uri.parse(baseUrl + getProfile), headers: headers
            // headers: {"Content-Type": "application/json"},
            );
    print(response.body);
    var decodedJson = json.decode(response.body);
    if (response.statusCode == 200) {
      return UserModel.fromJson(decodedJson['user']);
    } else {
      SERVER_FAILURE_MESSAGE = decodedJson['message'];
      throw ServerException();
    }
  }

  @override
  Future<UserModel> updateUser(UserModel userModel) async {
    var request =
        http.MultipartRequest('POST', Uri.parse(baseUrl + updateProfile));
    http.MultipartFile? imageFile = userModel.profileImage == null ? null : await http.MultipartFile.fromPath(
        'image', userModel.profileImage!);
    if (imageFile != null) {
      request.files.add(imageFile);
    }
    request.fields['first_name'] = userModel.firstName;
    request.fields['last_name'] = userModel.lastName;
    request.fields['phone'] = userModel.phone.toString();
    request.fields['email'] = userModel.email;
    request.fields['birthdate'] = userModel.birthdate ?? '';
    request.fields['length'] = userModel.length.toString() ?? '';
    request.fields['blood_type'] = userModel.bloodType ?? '';

    request.headers[HttpHeaders.authorizationHeader] =
        "Bearer ${GetStorage().read('token')}";
    request.headers['Accept'] = "application/json";

    print("fvdfv ${userModel}");

    var response = await request.send();

    var body = await response.stream.transform(utf8.decoder).first;
    var decodedJson = jsonDecode(body);
    print(decodedJson);
    if (response.statusCode == 200) {
      return UserModel.fromJson(decodedJson['user']);
    } else {
      SERVER_FAILURE_MESSAGE = decodedJson['message'];
      throw ServerException();
    }
  }

  Future<UserModel> updateUserWithOutImage(UserModel userModel) async {
    Uri url = Uri.parse(baseUrl + updateProfile);
    var map = {
      'first_name':userModel.firstName,
      'last_name':userModel.lastName,
      'phone':userModel.phone.toString(),
      'email':userModel.email,
      'birthdate':userModel.birthdate ?? '',
      'length':userModel.length.toString(),
      'blood_type':userModel.bloodType ?? '',
    };

    http.Response response = await http.post(url,body: map,headers: headers);


    print("fvdfv ${userModel}");

    var decodedJson = jsonDecode(response.body);
    print(decodedJson);
    if (response.statusCode == 200) {
      return UserModel.fromJson(decodedJson['user']);
    } else {
      SERVER_FAILURE_MESSAGE = decodedJson['message'];
      throw ServerException();
    }
  }
}
