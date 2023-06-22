import 'package:flutter/cupertino.dart';

import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_sample_auth/auth/data/datasources/auth_remote_data_sources.dart';
import 'package:test_sample_auth/auth/data/repositories/auth_repository_impl.dart';
import 'package:test_sample_auth/auth/domain/repositories/auth_repository.dart';
import 'package:test_sample_auth/auth/domain/usecases/post_login.dart';
import 'package:test_sample_auth/auth/presentation/login/cubit/auth_cubit.dart';
import 'package:test_sample_auth/core/api/dio_client.dart';
import 'package:test_sample_auth/core/common/pref_manager.dart';
import 'package:test_sample_auth/user_product/data/datasource/product_remote_datasources.dart';
import 'package:test_sample_auth/user_product/data/repositories/products_repository_impl.dart';
import 'package:test_sample_auth/user_product/domain/repositories/products_repository.dart';
import 'package:test_sample_auth/user_product/domain/usecases/get_products.dart';
import 'package:test_sample_auth/user_product/presentation/product/cubit/products_cubit.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  /// For unit testing only

  sl.registerSingleton<DioClient>(DioClient());

  dataSources();
  repositories();
  useCase();
  cubit();
}

// Register prefManager
void initPrefManager(SharedPreferences initPrefManager) {
  sl.registerLazySingleton<PrefManager>(() => PrefManager(initPrefManager));
}

/// Register repositories
void repositories() {
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));
  sl.registerLazySingleton<ProductsRepository>(
      () => ProductsRepositoryImpl(sl()));
}

/// Register dataSources
void dataSources() {
  sl.registerLazySingleton<AuthRemoteDatasource>(
    () => AuthRemoteDatasourceImpl(sl()),
  );
  sl.registerLazySingleton<ProductsRemoteDatasource>(
    () => ProductsRemoteDatasourceImpl(sl()),
  );
}

void useCase() {
  /// Auth
  sl.registerLazySingleton(() => PostLogin(sl()));
  sl.registerLazySingleton(() => GetProducts(sl()));
}

void cubit() {
  /// Auth

  sl.registerFactory(() => AuthCubit(sl()));

  /// Products
  sl.registerFactory(() => ProductsCubit(sl()));
}
