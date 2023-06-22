import 'package:dartz/dartz.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_sample_auth/auth/domain/entities/login.dart';
import 'package:test_sample_auth/auth/domain/repositories/auth_repository.dart';
import 'package:test_sample_auth/core/error/failure.dart';
import 'package:test_sample_auth/core/usecase/usecase.dart';

part 'post_login.freezed.dart';
part 'post_login.g.dart';

class PostLogin extends UseCase<Login, LoginParams> {
  final AuthRepository _repo;

  PostLogin(this._repo);

  @override
  Future<Either<Failure, Login>> call(LoginParams params) =>
      _repo.login(params);
}

@freezed
class LoginParams with _$LoginParams {
  const factory LoginParams({
    @Default("") String username,
    @Default("") String password,
  }) = _LoginParams;

  factory LoginParams.fromJson(Map<String, dynamic> json) =>
      _$LoginParamsFromJson(json);
}
