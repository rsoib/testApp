
import '../../domain/entities/trip_entity.dart';

class DestinationModel extends Destination {
  DestinationModel({required super.name, required super.code, required super.id, required super.country, required super.region, required super.district, required super.automated, required super.hasDestinations, required super.utc, required super.gpsCoordinates, required super.locationType, required super.locality, required super.stoppingPlace, required super.address, required super.phone});

  factory DestinationModel.fromJson(Map<String, dynamic> json) {
    return DestinationModel(
      name: json['Name'],
      code: json['Code'],
      id: json['Id'],
      country: json['Country'],
      region: json['Region'],
      district: json['District'],
      automated: json['Automated'],
      hasDestinations: json['HasDestinations'],
      utc: json['UTC'],
      gpsCoordinates: json['GPSCoordinates'],
      locationType: json['LocationType'],
      locality: json['Locality'],
      stoppingPlace: json['StoppingPlace'],
      address: json['Address'],
      phone: json['Phone'],
    );
  }
}