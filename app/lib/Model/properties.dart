import 'package:equatable/equatable.dart';

class Property extends Equatable {
  final int propertyId;
  final String propertyName;
  final String description;

  Property(this.propertyId, this.propertyName, this.description);

  factory Property.fromJson(Map<String, dynamic> map) {
    return Property(
      map['id_residential'],
      map['class_name'],
      map['description'],
    );
  }
  @override
  // TODO: implement props
  List<Object> get props => [propertyId, propertyName, description];

  @override
  String toString() {
    // TODO: implement toString
    return "Properties: {propertyId: $propertyId, name: $propertyName, description: $description}";
  }
}
