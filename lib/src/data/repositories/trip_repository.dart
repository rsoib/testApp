

import 'package:dartz/dartz.dart';
import 'package:testapp/src/domain/entities/trip_entity.dart';

import '../../../core/error/exception.dart';
import '../../../core/error/failure.dart';
import '../../../core/platform/network_info.dart';
import '../../domain/repositories/trip_repository.dart';
import '../datasources/trip_remote_data_source.dart';

class TripRepositoryImpl extends TripRepository {
  final TripRemoteDataSource tripRemoteDataSource;

  final NetworkInfo networkInfo;

  TripRepositoryImpl({
    required this.tripRemoteDataSource,
    required this.networkInfo
  });

  @override
  Future<Either<Failure, List<TripEntity>>>getTrips({
    required String departureCity,
    required String destinationCity,
    String? date
  }) async {
    if(await networkInfo.isConnected) {
      try {
        final data = await tripRemoteDataSource.getTrips(
          departureCity: departureCity,
          destinationCity: destinationCity,
          date: date
        );
        return Right(data);
      }catch (e, stackTrace) {
        print('error ${e.toString()}');
        print('stackTrace ${stackTrace.toString()}');
        if(e is LoginException){
          return Left(LoginFailure());
        }else {
          return Left(ServerFailure());
        }
      }
    }else {
      return Left(NetworkFailure());
    }
  }

}