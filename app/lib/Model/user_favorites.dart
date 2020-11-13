import 'package:equatable/equatable.dart';

class UserFav extends Equatable {
  final int favId;
  final int estateId;
  final int userId;
  final int propertyId;
  final String name;
  final String location;
  final String description;
  final int amount;

  UserFav(
    this.favId,
    this.estateId,
    this.userId,
    this.propertyId,
    this.name,
    this.location,
    this.description,
    this.amount,
  );

  factory UserFav.fromJson(Map<String, dynamic> map) {
    return UserFav(
      map['fav_id'],
      map['estate_id'],
      map['idusers'],
      map['property_id'],
      map['estate_name'],
      map['estate_location'],
      map['description'],
      map['amount'],
    );
  }

  @override
  String toString() {
    // TODO: implement toString
    return "User Favorites: {favId: $favId, estateId: $estateId, userId: $userId, propertyId: $propertyId, name: $name, location: $location, description: $description, amount: $amount}";
  }

  @override
  // TODO: implement props
  List<Object> get props => [
        favId,
        estateId,
        userId,
        propertyId,
        name,
        location,
        description,
        amount,
      ];
}
