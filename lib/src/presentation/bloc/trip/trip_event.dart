part of 'trip_bloc.dart';

@immutable
abstract class TripEvent {}

class LoadTrips extends TripEvent {
  final String departureCity;
  final String destinationCity;
  String? date;

  LoadTrips({
    required this.departureCity,
    required this.destinationCity,
    this.date
  });
}

class SelectDate extends TripEvent {
  final String date;

  SelectDate({
    required this.date
  });
}
