

import 'package:dartz/dartz.dart';
import 'package:testapp/src/domain/repositories/trip_repository.dart';
import '../../../core/error/failure.dart';
import '../../../core/usecases/usecase.dart';
import '../entities/trip_entity.dart';

class GetTrips extends UseCaseWithParams<dynamic, TripParams> {
  final TripRepository tripRepository;

  GetTrips(this.tripRepository);

  Future<Either<Failure, List<TripEntity>>> call(TripParams tripParams) async {
    return await tripRepository.getTrips(
        departureCity: tripParams.departureCity,
        destinationCity: tripParams.destinationCity,
        date: tripParams.date
    );
  }
}

class TripParams {
  final String departureCity;
  final String destinationCity;
  String? date;

  TripParams({
    required this.departureCity,
    required this.destinationCity,
    this.date
  });
}