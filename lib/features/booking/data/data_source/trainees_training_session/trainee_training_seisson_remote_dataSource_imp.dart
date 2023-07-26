import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:naz_gem/core/network/app_setting.dart';

import 'package:http/http.dart' as http;
import 'package:naz_gem/core/network/headers_data.dart';
import 'package:naz_gem/features/booking/data/data_source/trainees_training_session/trainees_training_session_remote_data_source.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/strings/failures.dart';
import '../../model/reservation_session_model.dart';

class TraineesTrainingSessionRemoteDataSourceImp extends TraineesTrainingSessionRemoteDataSource {
  final http.Client client;

  TraineesTrainingSessionRemoteDataSourceImp({required this.client});

  @override
  Future<ReservationSessionModel> cancelUserTrainingSession(String id) async {
    final response = await client.put(
      Uri.parse(baseUrl + cancelReservation.replaceFirst('{id}', id)),
      headers: headers,
    );
    final  decodedJson = json.decode(response.body) ;
    if (response.statusCode == 200) {
      final ReservationSessionModel postModels =
      ReservationSessionModel.fromJson(decodedJson['data']);
      return postModels;
    } else {
      SERVER_FAILURE_MESSAGE = decodedJson['message'] ;
      throw ServerException();
    }
  }

  @override
  Future<List<ReservationSessionModel>> getUserTrainingSessions() async {
    final response = await client.get(
      Uri.parse(baseUrl + getAllReservations),
      headers: headers,
    );

    final  decodedJson = json.decode(response.body) ;
    if (response.statusCode == 200) {

      final List<ReservationSessionModel> postModels = decodedJson['data']
          .map<ReservationSessionModel>((jsonPostModel) => ReservationSessionModel.fromJson(jsonPostModel))
          .toList();

      return postModels;
    } else {
      SERVER_FAILURE_MESSAGE = decodedJson['message'] ;
      throw ServerException();
    }
  }

  @override
  Future<ReservationSessionModel> getUserTrainingSession(String id) async {
    final response = await client.get(
      Uri.parse(baseUrl + getReservationDetails.replaceFirst('{id}', id)),
      headers: headers,
    );
    final  decodedJson = json.decode(response.body) ;
     if (response.statusCode == 200) {
      final ReservationSessionModel postModels =
          ReservationSessionModel.fromJson(decodedJson['data']);

      return postModels;
    } else {
       SERVER_FAILURE_MESSAGE = decodedJson['message'] ;
      throw ServerException();
    }
  }

  @override
  Future<List<ReservationSessionModel>> getUserTrainingSessionHistory() async {
    final response = await client.get(
      Uri.parse(baseUrl + getReservationHistory),
      headers: headers,
    );

    final  decodedJson = json.decode(response.body) ;

    if (response.statusCode == 200) {
      final List<ReservationSessionModel> postModels = decodedJson['data']
          .map<ReservationSessionModel>((jsonPostModel) => ReservationSessionModel.fromJson(jsonPostModel))
          .toList();

      return postModels;
    } else {
      SERVER_FAILURE_MESSAGE = decodedJson['message'] ;
      throw ServerException();
    }
  }

  @override
  Future<ReservationSessionModel> reservationNewTrainingSession(String id) async {
    var map = {
      'training_session_id':id
    };
    final response = await client.post(
      Uri.parse(baseUrl + makeNewReserve),
      headers: headers,
      body: map
    );
    final  decodedJson = json.decode(response.body) ;
    if (response.statusCode == 200) {
      final ReservationSessionModel postModels =
      ReservationSessionModel.fromJson(decodedJson['data']);

      return postModels;
    } else {
      SERVER_FAILURE_MESSAGE = decodedJson['message'] ;
      throw ServerException();
    }
  }

}