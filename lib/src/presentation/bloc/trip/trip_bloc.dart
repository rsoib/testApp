import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../../../../core/error/failure.dart';
import '../../../domain/entities/trip_entity.dart';
import '../../../domain/usecases/get_trips_usecase.dart';

part 'trip_event.dart';
part 'trip_state.dart';

class TripBloc extends Bloc<TripEvent, TripState> {
  final GetTrips getTrips;

  TripBloc({
    required this.getTrips,
  }) : super(const TripState()) {
    on<TripEvent>(_onGetTrips);
    on<SelectDate>(_onSelectDate);
  }

  Future<void> _onGetTrips(TripEvent event, Emitter<TripState> emit) async {
    try {
      if (event is LoadTrips) {
        emit(const TripState(status: TripStatus.loading));

        final failureOrTrips = await getTrips(TripParams(
            departureCity: event.departureCity,
            destinationCity: event.destinationCity,
            date: event.date
        ));

        failureOrTrips.fold(
              (failure) async {
                if (failure is ServerFailure) {
                  emit(const TripState(status: TripStatus.error));
                }
                if (failure is NetworkFailure) {
                  emit(const TripState(status: TripStatus.error));
                }
              },
              (trips) {
                emit(TripState(
                  status: TripStatus.loaded,
                  trips: trips
                ));
              },
        );
      }
    } catch (_) {
      emit(const TripState(status: TripStatus.error));
    }
  }

  void _onSelectDate(SelectDate event, Emitter<TripState> emit){
    emit(TripState(
        status: state.status,
        date: event.date,
        trips:  state.trips
    ));
  }
}
