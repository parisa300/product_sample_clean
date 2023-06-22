import 'package:dartz/dartz.dart';
import 'package:test_sample_auth/auth/data/datasources/auth_remote_data_sources.dart';
import 'package:test_sample_auth/auth/domain/entities/login.dart';

import 'package:test_sample_auth/auth/domain/repositories/auth_repository.dart';
import 'package:test_sample_auth/auth/domain/usecases/post_login.dart';
import 'package:test_sample_auth/core/error/failure.dart';


class AuthRepositoryImpl implements AuthRepository {
  /// Data Source
  final AuthRemoteDatasource authRemoteDatasource;

  const AuthRepositoryImpl(this.authRemoteDatasource);

  @override
  Future<Either<Failure, Login>> login(LoginParams loginParams) async {
    final response = await authRemoteDatasource.login(loginParams);

    return response.fold(
      (failure) => Left(failure),
      (loginResponse) {
        return Right(loginResponse.toEntity());
      },
    );
  }


}
