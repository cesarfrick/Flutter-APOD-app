import 'package:apod_gallery/components/media.dart';
import 'package:apod_gallery/models/picture_data.dart';
import 'package:flutter/material.dart';

class PictureDetails extends StatelessWidget {
  final PictureData picture;

  const PictureDetails({Key? key, required this.picture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(picture.title),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Media(mediaType: picture.mediaType, src: picture.url),
              ),
              Text(
                picture.copyright != null ? '© ${picture.copyright}' : '',
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              Text('Taken on: ${picture.date}',
                  style: const TextStyle(fontSize: 12),
                  textAlign: TextAlign.right),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
                alignment: Alignment.centerLeft,
                child: const Text('Summary',
                    style: TextStyle(fontSize: 20), textAlign: TextAlign.left),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Text(picture.summary),
              )
            ],
          ),
        ),
      ),
    );
  }
}
