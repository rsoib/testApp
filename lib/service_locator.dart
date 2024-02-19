import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testapp/src/data/datasources/trip_remote_data_source.dart';
import 'package:testapp/src/data/repositories/trip_repository.dart';
import 'package:testapp/src/domain/repositories/trip_repository.dart';
import 'package:testapp/src/domain/usecases/get_trips_usecase.dart';
import 'package:testapp/src/presentation/bloc/trip/trip_bloc.dart';


import 'core/platform/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() =>
      TripBloc(
        getTrips: sl()
      )
  );

  /// UseCases
  sl.registerLazySingleton(() => GetTrips(sl()));

  /// Repository
  sl.registerLazySingleton<TripRepository>(
          () => TripRepositoryImpl(
                tripRemoteDataSource: sl(),
                networkInfo: sl(),
          )
  );

  /// datasources
  sl.registerLazySingleton<TripRemoteDataSource>(() =>
      TripRemoteDataSourceImpl(
          client: http.Client()
      )
  );

  /// Core
  sl.registerLazySingleton<NetworkInfo>(
          () => NetworkInfoImpl(sl())
  );

  /// Extrenal
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());

}