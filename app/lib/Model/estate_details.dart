import 'package:equatable/equatable.dart';

class EstateAdditionalDetails extends Equatable {
  final int subId;
  final int estateId;
  final int rooms;
  final int garage;
  final int kitchens;
  final int bathrooms;
  final String desc;
  final double size;

  EstateAdditionalDetails(this.subId, this.estateId, this.rooms, this.garage,
      this.kitchens, this.bathrooms, this.desc, this.size);

  factory EstateAdditionalDetails.fromJson(Map<String, dynamic> map) {
    return EstateAdditionalDetails(
      map["sub_id"],
      map["estate_id"],
      map["no_of_rooms"],
      map["no_of_garage"],
      map["no_of_kitchens"],
      map["no_of_bathrooms"],
      map["description"],
      map["size"],
    );
  }

  @override
  String toString() {
    // TODO: implement toString
    return "Info: {estateId: $subId;, propertyId: $estateId, rooms: $rooms, garage: $garage, kitchens: $kitchens, bathrooms: $bathrooms, desc: $desc, size: $size}";
  }

  @override
  // TODO: implement props
  List<Object> get props => [
        subId,
        estateId,
        rooms,
        garage,
        kitchens,
        bathrooms,
        desc,
        size,
      ];
}
