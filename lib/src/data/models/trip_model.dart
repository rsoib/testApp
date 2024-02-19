
import 'package:testapp/src/data/models/carrier_data_model.dart';
import 'package:testapp/src/domain/entities/trip_entity.dart';
import 'package:intl/intl.dart';

import 'bus_model.dart';
import 'departure_model.dart';
import 'destination_model.dart';

class TripModel extends TripEntity {
  TripModel({
    required super.id,
    required super.routeId,
    required super.scheduleTripId,
    required super.routeName,
    required super.routeNum,
    required super.carrier,
    required super.bus,
    required super.driver1,
    required super.driver2,
    required super.frequency,
    required super.waybillNum,
    required super.status,
    required super.statusPrint,
    required super.statusReason,
    required super.statusComment,
    required super.statusDate,
    required super.departure,
    required super.departureTime,
    required super.arrivalToDepartureTime,
    required super.destination,
    required super.arrivalTime,
    required super.distance,
    required super.duration,
    required super.transitSeats,
    required super.freeSeatsAmount,
    required super.passengerFareCost,
    required super.fares,
    required super.platform,
    required super.onSale,
    required super.route,
    required super.additional,
    required super.additionalTripTime,
    required super.transitTrip,
    required super.saleStatus,
    required super.acbpdp,
    required super.factTripReturnTime,
    required super.currency,
    required super.principalTaxId,
    required super.carrierData,
    required super.passengerFareCostAvibus,
    required super.depDate,
    required super.depTime,
    required super.arrDate,
    required super.arrTime
  });

  factory TripModel.fromJson(Map<String, dynamic> json) {
    String? departureTime = json['DepartureTime'] != null ? DateFormat('HH:mm').format(DateTime.parse(json['DepartureTime'])) : null;
    String departureDate = json['DepartureTime'] != null ? DateFormat('dd.MM.yyyy').format(DateTime.parse(json['DepartureTime'])) : '';

    String? arrivalTime = json['ArrivalTime'] != null ? DateFormat('HH:mm').format(DateTime.parse(json['ArrivalTime'])) : null;
    String arrivalDate = json['ArrivalTime'] != null ? DateFormat('dd.MM.yyyy').format(DateTime.parse(json['ArrivalTime'])) : '';


    return TripModel(
      id: json['Id'],
      routeId: json['RouteId'],
      scheduleTripId: json['ScheduleTripId'],
      routeName: json['RouteName'],
      routeNum: json['RouteNum'],
      carrier: json['Carrier'],
      bus: BusModel.fromJson(json['Bus']),
      depTime: departureTime,
      depDate: departureDate,
      driver1: json['Driver1'],
      driver2: json['Driver2'],
      arrDate: arrivalDate,
      arrTime: arrivalTime,
      frequency: json['Frequency'],
      waybillNum: json['WaybillNum'],
      status: json['Status'],
      statusPrint: json['StatusPrint'],
      statusReason: json['StatusReason'],
      statusComment: json['StatusComment'],
      statusDate: json['StatusDate'],
      departure: DepartureModel.fromJson(json['Departure']),
      departureTime: json['DepartureTime'],
      arrivalToDepartureTime: json['ArrivalToDepartureTime'],
      destination: DestinationModel.fromJson(json['Destination']),
      arrivalTime: json['ArrivalTime'],
      distance: json['Distance'],
      duration: json['Duration'],
      transitSeats: json['TransitSeats'],
      freeSeatsAmount: json['FreeSeatsAmount'],
      passengerFareCost: json['PassengerFareCost'],
      fares: json['Fares'],
      platform: json['Platform'],
      onSale: json['OnSale'],
      route: json['Route'],
      additional: json['Additional'],
      additionalTripTime: json['AdditionalTripTime'],
      transitTrip: json['TransitTrip'],
      saleStatus: json['SaleStatus'],
      acbpdp: json['ACBPDP'],
      factTripReturnTime: json['FactTripReturnTime'],
      currency: json['Currency'],
      principalTaxId: json['PrincipalTaxId'],
      carrierData: CarrierDataModel.fromJson(json['CarrierData']),
      passengerFareCostAvibus: json['PassengerFareCostAvibus'],
    );
  }
}