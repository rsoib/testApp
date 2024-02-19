part of 'trip_bloc.dart';

enum TripStatus {initial, loading, loaded, error}

@immutable
class TripState extends Equatable {

  const TripState({
    this.status = TripStatus.initial,
    this.trips = const [],
    this.date = ''
  });

  final TripStatus status;
  final List<TripEntity> trips;
  final String date;

  TripState copyWith({
    TripStatus? status,
    int? grade,
    List<TripEntity>? trips,
    String? date

  }) {
    return TripState(
      status: status ?? this.status,
      trips: trips ?? this.trips,
      date: date ?? this.date
    );
  }

  @override
  List<Object> get props => [
    status,
    trips,
    date
  ];
}