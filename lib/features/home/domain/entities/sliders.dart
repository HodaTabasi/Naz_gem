import 'package:equatable/equatable.dart';

class MySlider extends Equatable{
  int? id;
  String? image;
  String? title;
  String? description;
  String? url;

  MySlider({this.id, this.image, this.title, this.description, this.url});

  @override
  // TODO: implement props
  List<Object?> get props => [id,image,title,description,url];

}