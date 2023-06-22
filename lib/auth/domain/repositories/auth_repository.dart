import 'package:dartz/dartz.dart';
import 'package:test_sample_auth/auth/domain/entities/login.dart';

import 'package:test_sample_auth/auth/domain/usecases/post_login.dart';
import 'package:test_sample_auth/core/error/failure.dart';


abstract class AuthRepository {
  Future<Either<Failure, Login>> login(LoginParams loginParams);


}
