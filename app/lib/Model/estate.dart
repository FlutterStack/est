import 'package:equatable/equatable.dart';

class EstateInfo extends Equatable {
  final int estateId;
  final int propertyId;
  final String name;
  final String location;
  final String description;
  final int amount;

  EstateInfo(this.estateId, this.propertyId, this.name, this.location,
      this.description, this.amount);

  factory EstateInfo.fromJson(Map<String, dynamic> map) {
    return EstateInfo(
      map["estate_id"],
      map["property_id"],
      map["estate_name"],
      map["estate_location"],
      map["description"],
      map["amount"],
    );
  }

  @override
  String toString() {
    return "Estate: {estateId: $estateId, propertyId: $propertyId, name: $name, location: $location, description: $description, amount: $amount}";
  }

  @override
  List<Object> get props => [
        estateId,
        propertyId,
        name,
        location,
        description,
        amount,
      ];
}
