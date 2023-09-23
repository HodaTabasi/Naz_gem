import 'package:equatable/equatable.dart';
import 'package:naz_gem/features/bill/domain/entities/subscription.dart';

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
  Subscription? activeSubscription;

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
      this.activeSubscription,
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
        length,
        activeSubscription
      ];

  @override
  String toString() {
    return 'User{firstName: $firstName, lastName: $lastName, phone: $phone, email: $email, type: $type, updatedAt: $updatedAt, createdAt: $createdAt, id: $id, identifier: $identifier, birthdate: $birthdate, length: $length, bloodType: $bloodType, profileImage: $profileImage}';
  }
}
