import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int userId;
  final String firstName;
  final String lastName;
  final String email;
  final String mobileNo;
  final String password;
  final String imgpath;

  User(this.userId, this.firstName, this.lastName, this.email, this.mobileNo,
      this.password, this.imgpath);

  factory User.fromJson(Map<String, dynamic> map) {
    return User(
      map['idusers'],
      map['first_name'],
      map['last_name'],
      map['email'],
      map['mobile_no'],
      map['password'],
      map["img_path"],
    );
  }
  @override
  List<Object> get props =>
      [userId, firstName, lastName, email, mobileNo, password, imgpath];

  @override
  String toString() {
    return "User: {userId: $userId, firstName: $firstName, lastName: $lastName, email: $email, mobile: $mobileNo, password: $password}";
  }
}
