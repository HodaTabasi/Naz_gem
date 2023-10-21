import 'package:naz_gem/features/auth/domain/entities/user.dart';
import 'package:naz_gem/features/bill/data/model/SubscriptionModel.dart';

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
      activeSubscription,
      profileImage})
      : super(
            firstName: firstName,
            lastName: lastName,
            id: int.tryParse('$id')??0,
            identifier: identifier??'',
            email: email,
            phone: phone,
            type: type,
            birthdate: birthdate,
            bloodType: bloodType,
            length: length,
            activeSubscription: activeSubscription,
            profileImage: profileImage);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    // print(json);
    // // print(json.containsKey('length'));
    // // print(json.containsKey('blood_type'));
    // // print(json.containsKey('profile_image'));

    UserModel user = UserModel(
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
      identifier: json['identifier']?? '',
      id: json['id']?? 0,
      lastName: json['last_name']?? '',
      firstName: json['first_name'] ?? '',
      length: json['length'].toString()??'',
      bloodType: json['blood_type']??'',
      profileImage: json['profile_image']);
    if(json['active_subscription'] != null){
      user.activeSubscription = SubscriptionModel.fromJson(json['active_subscription']);
    }
    if (json.containsKey('birthdate')) {
      user.birthdate = json['birthdate'];
    }else if (json.containsKey('type')) {
      user.type = json['type'];
    }

    return user;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // data['id'] = this.id;
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
