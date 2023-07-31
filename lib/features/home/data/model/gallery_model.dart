import 'package:naz_gem/features/home/domain/entities/gallery.dart';

class GalleryModel extends Gallery {
  GalleryModel(
      {id, title, type, typeName, yotubeVedioUrl, thumbnailPath, attachment})
      : super(
            id: id,
            title: title,
            type: type,
            typeName: typeName,
            attachment: attachment,
            thumbnailPath: thumbnailPath,
            yotubeVedioUrl: yotubeVedioUrl);

  factory GalleryModel.fromJson(Map<String, dynamic> json) {
    return GalleryModel(
        id: json['id'],
        title: json['title'],
        type: json['type'],
        typeName: json['type_name'],
        thumbnailPath: json['thumbnail_path'],
        yotubeVedioUrl: json['yotube_vedio_url'],
        attachment: json['attachment']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'type': type,
      'typeName': typeName,
      'attachment': attachment,
      'yotube_vedio_url': this.yotubeVedioUrl,
      'thumbnail_path': this.thumbnailPath,
    };
  }
}
