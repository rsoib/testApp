

import '../../domain/entities/trip_entity.dart';
import 'carrier_personal_data_model.dart';

class CarrierDataModel extends CarrierData {
  CarrierDataModel({required super.carrierName, required super.carrierTaxId, required super.carrierStateRegNum, required super.carrierPersonalData, required super.carrierAddress, required super.carrierWorkingHours});

  factory CarrierDataModel.fromJson(Map<String, dynamic> json) {
    return CarrierDataModel(
      carrierName: json['CarrierName'],
      carrierTaxId: json['CarrierTaxId'],
      carrierStateRegNum: json['CarrierStateRegNum'],
      carrierPersonalData: List<CarrierPersonalData>.from(json['CarrierPersonalData'].map((x) => CarrierPersonalDataModel.fromJson(x))),
      carrierAddress: json['CarrierAddress'],
      carrierWorkingHours: json['CarrierWorkingHours'],
    );
  }
}