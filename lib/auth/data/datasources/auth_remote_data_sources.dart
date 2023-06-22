import 'package:dartz/dartz.dart';
import 'package:test_sample_auth/auth/data/models/login_model/login_response.dart';

import 'package:test_sample_auth/auth/domain/usecases/post_login.dart';
import 'package:test_sample_auth/core/api/dio_client.dart';
import 'package:test_sample_auth/core/api/list_api.dart';
import 'package:test_sample_auth/core/error/failure.dart';

abstract class AuthRemoteDatasource {
  Future<Either<Failure, LoginResponse>> login(LoginParams loginParams);
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final DioClient _client;

  AuthRemoteDatasourceImpl(this._client);

  @override
  Future<Either<Failure, LoginResponse>> login(LoginParams loginParams) async {
    final response = await _client.postRequest(
      ListAPI.login,
      data: loginParams.toJson(),
      converter: (response) =>
          LoginResponse.fromJson(response as Map<String, dynamic>),
    );

    return response;
  }
}
