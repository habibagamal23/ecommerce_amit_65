import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../features/login/logic/login_cubit.dart';
import '../networks/AuthService.dart';
import '../networks/dio_factory.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerLazySingleton<Dio>(() => DioFactory.getDio());
  getIt.registerLazySingleton<AuthService>(() => AuthService(getIt<Dio>()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<AuthService>()));
}
