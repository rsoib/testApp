
import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import '../entities/trip_entity.dart';

abstract class TripRepository {
  Future<Either<Failure, List<TripEntity>>>getTrips({
    required String departureCity,
    required String destinationCity,
    String? date
  });
}