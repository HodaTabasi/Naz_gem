import 'package:naz_gem/features/home/domain/entities/gallery.dart';

class GalleryModel extends Gallery {
  GalleryModel({id, title, type, typeName, attachment})
      : super(
          id: id,
          title: title,
          type: type,
          typeName: typeName,
          attachment: attachment,
        );

  factory GalleryModel.fromJson(Map<String, dynamic> json) {
    return GalleryModel(
        id: json['id'],
        title: json['title'],
        type: json['type'],
        typeName: json['typeName'],
        attachment: json['attachment']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'type': type,
      'typeName': typeName,
      'attachment': attachment
    };
  }
}
