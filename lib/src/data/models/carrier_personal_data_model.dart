
import 'package:testapp/src/data/models/default_value_variant_model.dart';

import '../../domain/entities/trip_entity.dart';

class CarrierPersonalDataModel extends CarrierPersonalData {
  CarrierPersonalDataModel({required super.name, required super.caption, required super.mandatory, required super.personIdentifier, required super.type, required super.valueVariants, required super.inputMask, required super.value, required super.valueKind, required super.defaultValueVariant, required super.documentIssueDateRequired, required super.documentIssueOrgRequired, required super.documentValidityDateRequired, required super.documentInceptionDateRequired, required super.documentIssuePlaceRequired, required super.value1, required super.value2, required super.value3, required super.value4, required super.value5});

  factory CarrierPersonalDataModel.fromJson(Map<String, dynamic> json) {
    return CarrierPersonalDataModel(
      name: json['Name'],
      caption: json['Caption'],
      mandatory: json['Mandatory'],
      personIdentifier: json['PersonIdentifier'],
      type: json['Type'],
      valueVariants: json['ValueVariants'],
      inputMask: json['InputMask'],
      value: json['Value'],
      valueKind: json['ValueKind'],
      defaultValueVariant: DefaultValueVariantModel.fromJson(json['DefaultValueVariant']),
      documentIssueDateRequired: json['DocumentIssueDateRequired'],
      documentIssueOrgRequired: json['DocumentIssueOrgRequired'],
      documentValidityDateRequired: json['DocumentValidityDateRequired'],
      documentInceptionDateRequired: json['DocumentInceptionDateRequired'],
      documentIssuePlaceRequired: json['DocumentIssuePlaceRequired'],
      value1: json['Value1'],
      value2: json['Value2'],
      value3: json['Value3'],
      value4: json['Value4'],
      value5: json['Value5'],
    );
  }
}