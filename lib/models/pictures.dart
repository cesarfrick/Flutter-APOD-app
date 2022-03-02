import 'package:apod_gallery/models/picture_data.dart';
import 'package:flutter/foundation.dart';

@immutable
class Pictures {
  final List<PictureData> pictures;

  const Pictures(
    this.pictures,
  );

  factory Pictures.fromJson(List json) =>
      Pictures(json.map((picture) => PictureData.fromJson(picture)).toList());
}
