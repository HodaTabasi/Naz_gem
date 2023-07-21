import '../../domain/entities/sliders.dart';

class SliderModel extends MySlider {

  SliderModel({id, image, title,description, url}):super(id: id,image: image,title: title,description: description,url: url);

  factory SliderModel.fromJson(Map<String, dynamic> json){
    return SliderModel(id: json['id'],image: json['image'],title: json['title'],description: json['description'],url: json['url']);
  }

  Map<String, dynamic> toJson(){
    return {
      'id':id,
      'image':image,
      'title':title,
      'description':description,
      'url':url
    };
  }
}