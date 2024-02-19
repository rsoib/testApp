class TripEntity {
  final String id;
  final String? routeId;
  final String? scheduleTripId;
  final String? routeName;
  final String? routeNum;
  final String? carrier;
  final Bus? bus;
  final String? driver1;
  final String? driver2;
  final String? frequency;
  final String? waybillNum;
  final String? status;
  final String? statusPrint;
  final String? statusReason;
  final String? statusComment;
  final String? statusDate;
  final Departure departure;
  final String? departureTime;
  final String? depDate;
  final String? depTime;
  final String? arrDate;
  final String? arrTime;
  final String? arrivalToDepartureTime;
  final Destination destination;
  final String? arrivalTime;
  final String? distance;
  final int? duration;
  final bool? transitSeats;
  final int? freeSeatsAmount;
  final String passengerFareCost;
  final List<dynamic> fares;
  final int platform;
  final bool onSale;
  final List<dynamic> route;
  final bool additional;
  final List<dynamic> additionalTripTime;
  final dynamic transitTrip;
  final dynamic saleStatus;
  final bool acbpdp;
  final dynamic factTripReturnTime;
  final String currency;
  final String principalTaxId;
  final CarrierData carrierData;
  final String passengerFareCostAvibus;

  TripEntity({
    required this.id,
    required this.routeId,
    required this.scheduleTripId,
    required this.routeName,
    required this.routeNum,
    required this.carrier,
    required this.bus,
    required this.driver1,
    required this.driver2,
    required this.frequency,
    required this.waybillNum,
    required this.status,
    required this.statusPrint,
    required this.statusReason,
    required this.statusComment,
    required this.statusDate,
    required this.departure,
    required this.departureTime,
    required this.arrivalToDepartureTime,
    required this.destination,
    required this.arrivalTime,
    required this.distance,
    required this.duration,
    required this.transitSeats,
    required this.freeSeatsAmount,
    required this.passengerFareCost,
    required this.fares,
    required this.platform,
    required this.onSale,
    required this.route,
    required this.additional,
    required this.additionalTripTime,
    required this.transitTrip,
    required this.saleStatus,
    required this.acbpdp,
    required this.factTripReturnTime,
    required this.currency,
    required this.principalTaxId,
    required this.carrierData,
    required this.passengerFareCostAvibus,
    required this.depDate,
    required this.depTime,
    required this.arrDate,
    required this.arrTime
  });


}

class Bus {
  final String? id;
  final String? model;
  final String? licencePlate;
  final String? name;
  final String? seatsClass;
  final int? seatCapacity;
  final int? standCapacity;
  final int? baggageCapacity;
  final List<dynamic>? seatsScheme;
  final dynamic garageNum;

  Bus({
    required this.id,
    required this.model,
    required this.licencePlate,
    required this.name,
    required this.seatsClass,
    required this.seatCapacity,
    required this.standCapacity,
    required this.baggageCapacity,
    required this.seatsScheme,
    required this.garageNum,
  });
}

class Departure {
  final String name;
  final String code;
  final String id;
  final String? country;
  final String? region;
  final dynamic district;
  final bool? automated;
  final bool? hasDestinations;
  final String? utc;
  final String? gpsCoordinates;
  final String? locationType;
  final dynamic locality;
  final dynamic stoppingPlace;
  final String? address;
  final dynamic phone;

  Departure({
    required this.name,
    required this.code,
    required this.id,
    required this.country,
    required this.region,
    required this.district,
    required this.automated,
    required this.hasDestinations,
    required this.utc,
    required this.gpsCoordinates,
    required this.locationType,
    required this.locality,
    required this.stoppingPlace,
    required this.address,
    required this.phone,
  });
}

class Destination {
  final String? name;
  final String? code;
  final String? id;
  final String? country;
  final String? region;
  final dynamic district;
  final bool? automated;
  final bool? hasDestinations;
  final String? utc;
  final String? gpsCoordinates;
  final String? locationType;
  final dynamic locality;
  final dynamic stoppingPlace;
  final String? address;
  final dynamic phone;

  Destination({
    required this.name,
    required this.code,
    required this.id,
    required this.country,
    required this.region,
    required this.district,
    required this.automated,
    required this.hasDestinations,
    required this.utc,
    required this.gpsCoordinates,
    required this.locationType,
    required this.locality,
    required this.stoppingPlace,
    required this.address,
    required this.phone,
  });
}

class CarrierData {
  final String? carrierName;
  final String? carrierTaxId;
  final String? carrierStateRegNum;
  final List<CarrierPersonalData>? carrierPersonalData;
  final String? carrierAddress;
  final String? carrierWorkingHours;

  CarrierData({
    required this.carrierName,
    required this.carrierTaxId,
    required this.carrierStateRegNum,
    required this.carrierPersonalData,
    required this.carrierAddress,
    required this.carrierWorkingHours,
  });
}

class CarrierPersonalData {
  final String? name;
  final String? caption;
  final bool? mandatory;
  final bool? personIdentifier;
  final String? type;
  final List<dynamic>? valueVariants;
  final String? inputMask;
  final String? value;
  final dynamic valueKind;
  final DefaultValueVariant defaultValueVariant;
  final dynamic documentIssueDateRequired;
  final dynamic documentIssueOrgRequired;
  final dynamic documentValidityDateRequired;
  final dynamic documentInceptionDateRequired;
  final dynamic documentIssuePlaceRequired;
  final dynamic value1;
  final dynamic value2;
  final dynamic value3;
  final dynamic value4;
  final dynamic value5;

  CarrierPersonalData({
    required this.name,
    required this.caption,
    required this.mandatory,
    required this.personIdentifier,
    required this.type,
    required this.valueVariants,
    required this.inputMask,
    required this.value,
    required this.valueKind,
    required this.defaultValueVariant,
    required this.documentIssueDateRequired,
    required this.documentIssueOrgRequired,
    required this.documentValidityDateRequired,
    required this.documentInceptionDateRequired,
    required this.documentIssuePlaceRequired,
    required this.value1,
    required this.value2,
    required this.value3,
    required this.value4,
    required this.value5,
  });
}

class DefaultValueVariant {
  final dynamic name;
  final dynamic inputMask;
  final dynamic valueProperty1;
  final dynamic valueProperty2;
  final dynamic valueProperty3;
  final dynamic valueProperty4;
  final dynamic valueProperty5;

  DefaultValueVariant({
    required this.name,
    required this.inputMask,
    required this.valueProperty1,
    required this.valueProperty2,
    required this.valueProperty3,
    required this.valueProperty4,
    required this.valueProperty5,
  });
}
