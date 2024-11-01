import 'package:dio/dio.dart';
import 'package:ecommerce65/core/networks/home_service.dart';
import 'package:get_it/get_it.dart';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../features/home/logic/home_cubit.dart';
import '../../features/login/logic/login_cubit.dart';
import '../../features/productsscreen/prudct_cubit.dart';
import '../networks/AuthService.dart';
import '../networks/dio_factory.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerLazySingleton<Dio>(() => DioFactory.getDio());

  // auth
  getIt.registerLazySingleton<AuthService>(() => AuthService(getIt<Dio>()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<AuthService>()));

  // home
  getIt.registerLazySingleton<HomeService>(() => HomeService(getIt<Dio>()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt<HomeService>()));
  getIt.registerFactory<PrudctCubit>(() => PrudctCubit(getIt<HomeService>()));


}
