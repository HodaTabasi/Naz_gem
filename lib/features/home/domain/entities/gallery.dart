import 'package:equatable/equatable.dart';

class Gallery extends Equatable {

  int? id;
  String? title;
  int? type;
  String? typeName;
  String? yotubeVedioUrl;
  String? thumbnailPath;
  String? attachment;

  Gallery({this.id,
    this.title,
    this.type,
    this.typeName,
    this.yotubeVedioUrl,
    this.thumbnailPath,
    this.attachment});

  @override
  // TODO: implement props
  List<Object?> get props => [id,title,type,typeName,attachment,yotubeVedioUrl,thumbnailPath];
}