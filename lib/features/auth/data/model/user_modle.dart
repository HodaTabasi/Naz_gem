import 'package:naz_gem/features/auth/domain/entities/user.dart';

class UserModel extends User {
  UserModel(
      {firstName,
      lastName,
      phone,
      email,
      type,
      id,
      identifier,
      birthdate,
      bloodType,
      length,
      profileImage})
      : super(
            firstName: firstName,
            lastName: lastName,
            id: id??0,
            identifier: identifier??'',
            email: email,
            phone: phone,
            type: type,
            birthdate: birthdate,
            bloodType: bloodType,
            length: length,
            profileImage: profileImage);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    UserModel user = UserModel(
      phone: json['phone'],
      email: json['email'],
      identifier: json['identifier'],
      id: json['id'],
      lastName: json['last_name'],
      firstName: json['first_name'],
    );
    if (json.containsKey('birthdate')) {
      user.birthdate = json['birthdate'];
    } else if (json.containsKey('length')) {
      user.length = json['length'];
    } else if (json.containsKey('blood_type')) {
      user.bloodType = json['blood_type']??'';
    } else if (json.containsKey('profile_image')) {
      user.profileImage = json['profile_image'];
    } else if (json.containsKey('type')) {
      user.type = json['type'];
    }

    return user;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['birthdate'] = this.birthdate;
    data['length'] = this.length;
    data['blood_type'] = this.bloodType;
    data['identifier'] = this.identifier;
    data['profile_image'] = this.profileImage;
    return data;
  }


}
