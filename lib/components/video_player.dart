import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayer extends StatefulWidget {
  final String url;
  const VideoPlayer({Key? key, required this.url}) : super(key: key);

  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  YoutubePlayerController? _playerController;

  @override
  void initState() {
    _playerController = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(widget.url)!,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          controlsVisibleAtStart: true,
          useHybridComposition: true,
        ));

    super.initState();
  }

  @override
  void dispose() {
    _playerController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
        player: YoutubePlayer(controller: _playerController!),
        builder: (context, player) => Column(
              children: [player],
              mainAxisSize: MainAxisSize.max,
            ));
  }
}
