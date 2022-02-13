import 'package:flutter/material.dart';
import 'package:apod_gallery/components/video_player.dart';

class Media extends StatelessWidget {
  const Media({Key? key, required this.mediaType, required this.src})
      : super(key: key);

  final String mediaType;
  final String src;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: mediaType == 'image'
            ? Image.network(
                src,
                alignment: Alignment.center,
              )
            : VideoPlayer(url: src));
  }
}
