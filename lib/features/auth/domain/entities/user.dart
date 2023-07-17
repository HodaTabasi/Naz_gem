import 'package:equatable/equatable.dart';

class User extends Equatable {
  late String firstName;
  late String lastName;
  late String phone;
  late String email;
  int? type;
  String? updatedAt;
  String? createdAt;
  int? id;
  String? identifier;
  String? birthdate;
  String? length;
  String? bloodType;
  String? profileImage;

  User(
      {required this.firstName,
      required this.lastName,
      required this.phone,
      required this.email,
      this.id = 0,
      this.identifier = '',
      this.type,
      this.length,
      this.profileImage,
      this.birthdate,
      this.bloodType});

  @override
  // TODO: implement props
  List<Object?> get props => [
        firstName,
        lastName,
        phone,
        email,
        type,
        updatedAt,
        createdAt,
        id,
        identifier,
        birthdate,
        bloodType,
        profileImage,
        length
      ];
}
