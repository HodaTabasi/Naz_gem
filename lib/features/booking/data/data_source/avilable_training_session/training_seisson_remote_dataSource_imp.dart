import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:naz_gem/core/network/app_setting.dart';



import 'package:http/http.dart' as http;
import 'package:naz_gem/core/network/headers_data.dart';
import 'package:naz_gem/features/booking/data/model/session_model.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/strings/failures.dart';
import 'Training_session_remote_data_source.dart';

class TrainingSessionRemoteDataSourceImp extends TrainingSessionRemoteDataSource {
  final http.Client client;

  TrainingSessionRemoteDataSourceImp({required this.client});

  @override
  Future<List<SessionModel>> getAllTrainingSessions(date,page) async {
      final response = await client.get(
        Uri.parse('$baseUrl$getAllTrainingSession?date=$date&page=$page'),
        headers: headers,
      );
      final  decodedJson = json.decode(response.body);
      if (response.statusCode == 200) {
        print("fgfg ${decodedJson}");
        GetStorage().write('lastPage',decodedJson['meta']['last_page']);
        final List<SessionModel> listModels = decodedJson['data']
            .map<SessionModel>((jsonPostModel) => SessionModel.fromJson(jsonPostModel))
            .toList();

        return listModels;
      } else {
        SERVER_FAILURE_MESSAGE = decodedJson['message'];
        throw ServerException();
      }
  }

  @override
  Future<SessionModel> getTrainingSession(String id) async {
    final response = await client.get(
      Uri.parse(baseUrl + getTrainDetails.replaceFirst('{id}', id)),
      headers: headers,
    );
    final  decodedJson = json.decode(response.body);
    if (response.statusCode == 200) {
      final SessionModel sessionModel = SessionModel.fromJson( decodedJson['data']);

      return sessionModel;
    } else {
      SERVER_FAILURE_MESSAGE = decodedJson['message'];
      throw ServerException();
    }
  }
}