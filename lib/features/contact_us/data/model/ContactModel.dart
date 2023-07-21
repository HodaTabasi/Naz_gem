import '../../domain/entities/contact.dart';

class ContactModel extends Contact {
  ContactModel({id, key, value}) : super(id: id, value: value, key: key);

  factory ContactModel.fromJson(Map<String, dynamic> json){
    return ContactModel(key: json['key'],value: json['value'],id: json['id']);
  }

  Map<String, dynamic> toJson(){
    return {
      'id':id,
      'value':value,
      'key':key
    };
  }
}
