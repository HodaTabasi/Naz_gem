import 'package:dartz/dartz.dart';
import 'package:naz_gem/core/network/app_setting.dart';



import 'package:http/http.dart' as http;

import 'Training_session_remote_data_source.dart';

class TrainingSessionRemoteDataSourceImp extends TrainingSessionRemoteDataSource {
  final http.Client client;

  TrainingSessionRemoteDataSourceImp({required this.client});

  @override
  Future<Unit> getAllTrainingSessions() async {
      final response = await client.get(
        Uri.parse(baseUrl + getAllTrainingSession),
        headers: {"Content-Type": "application/json"},
      );
    throw UnimplementedError();
  }

  @override
  Future<Unit> getTrainingSession(String id) async {
    final response = await client.get(
      Uri.parse(baseUrl + getTrainDetails.replaceFirst('{id}', id)),
      headers: {"Content-Type": "application/json"},
    );
    throw UnimplementedError();
  }

  @override
  Future<Unit> reserveTrainingSession(String id) async {
    var map = {
      'training_session_id':id
    };

    final response = await client.post(
      Uri.parse(baseUrl + postReserve),
      body: map,
      headers: {"Content-Type": "application/json"},
    );
    throw UnimplementedError();
  }
}