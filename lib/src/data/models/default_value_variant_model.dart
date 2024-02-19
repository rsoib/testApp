
import '../../domain/entities/trip_entity.dart';

class DefaultValueVariantModel extends DefaultValueVariant {
  DefaultValueVariantModel({required super.name, required super.inputMask, required super.valueProperty1, required super.valueProperty2, required super.valueProperty3, required super.valueProperty4, required super.valueProperty5});

  factory DefaultValueVariantModel.fromJson(Map<String, dynamic> json) {
    return DefaultValueVariantModel(
      name: json['Name'],
      inputMask: json['InputMask'],
      valueProperty1: json['ValueProperty1'],
      valueProperty2: json['ValueProperty2'],
      valueProperty3: json['ValueProperty3'],
      valueProperty4: json['ValueProperty4'],
      valueProperty5: json['ValueProperty5'],
    );
  }
}