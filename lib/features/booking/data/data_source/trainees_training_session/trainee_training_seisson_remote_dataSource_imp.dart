import 'package:dartz/dartz.dart';
import 'package:naz_gem/core/network/app_setting.dart';

import 'package:http/http.dart' as http;
import 'package:naz_gem/core/network/headers_data.dart';
import 'package:naz_gem/features/booking/data/data_source/trainees_training_session/trainees_training_session_remote_data_source.dart';

class TrainingSessionRemoteDataSourceImp extends TraineesTrainingSessionRemoteDataSource {
  final http.Client client;

  TrainingSessionRemoteDataSourceImp({required this.client});

  @override
  Future<Unit> cancelUserTrainingSession(String id) async {
    final response = await client.put(
      Uri.parse(baseUrl + updateReservation.replaceFirst('{id}', id)),
      headers: headers,
    );
    throw UnimplementedError();
  }

  @override
  Future<Unit> getUserTrainingSessions() async {
    final response = await client.get(
      Uri.parse(baseUrl + getAllReservations),
      headers: headers,
    );
    throw UnimplementedError();
  }

  @override
  Future<Unit> getUserTrainingSession(String id) async {
    final response = await client.get(
      Uri.parse(baseUrl + getReservationDetails.replaceFirst('{id}', id)),
      headers: {"Content-Type": "application/json"},
    );
    throw UnimplementedError();
  }

}