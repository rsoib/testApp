

import '../../domain/entities/trip_entity.dart';

class BusModel extends Bus {
  BusModel({required super.id, required super.model, required super.licencePlate, required super.name, required super.seatsClass, required super.seatCapacity, required super.standCapacity, required super.baggageCapacity, required super.seatsScheme, required super.garageNum});

  factory BusModel.fromJson(Map<String, dynamic> json) {
    return BusModel(
      id: json['Id'],
      model: json['Model'],
      licencePlate: json['LicencePlate'],
      name: json['Name'],
      seatsClass: json['SeatsClass'],
      seatCapacity: json['SeatCapacity'],
      standCapacity: json['StandCapacity'],
      baggageCapacity: json['BaggageCapacity'],
      seatsScheme: json['SeatsScheme'],
      garageNum: json['GarageNum'],
    );
  }
}