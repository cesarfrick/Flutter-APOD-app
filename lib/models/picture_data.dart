import 'dart:convert';

class PictureData {
  final String? hdurl;
  final String? copyright;
  final String date;
  final String summary;
  final String mediaType;
  final String title;
  final String url;
  final String videoThumbnail;
  bool isFavorite = false;

  PictureData({
    this.hdurl,
    this.copyright,
    this.isFavorite = false,
    required this.date,
    required this.summary,
    required this.title,
    required this.url,
    required this.mediaType,
    required this.videoThumbnail,
  });

  @override
  String toString() {
    return 'PictureData(date: $date, explanation: $summary, hdurl: $hdurl, title: $title, url: $url)';
  }

  factory PictureData.fromJson(Map<String, dynamic> data) => PictureData(
        date: data['date'],
        summary: data['explanation'],
        hdurl: data['hdurl'],
        title: data['title'],
        url: data['url'],
        mediaType: data['media_type'],
        copyright: data['copyright'],
        videoThumbnail: data['thumbnail_url'] ?? '',
      );

  Map<String, dynamic> toMap() => {
        'date': date,
        'explanation': summary,
        'hdurl': hdurl,
        'title': title,
        'url': url,
        'video_thumbnail': videoThumbnail,
        'copyright': copyright,
      };

  /// Converts [PictureData] to a JSON string.
  String toJson() => json.encode(toMap());
}
