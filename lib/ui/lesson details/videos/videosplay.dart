import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayVideoScreen extends StatefulWidget {
  YoutubePlayVideoScreen({super.key,required this.videoUrl});
  static const String YoutubePlayVideoScreenname = 'YoutubePlayVideoScreen';
  String videoUrl ;
  @override
  _YoutubePlayVideoScreenState createState() => _YoutubePlayVideoScreenState();
}

class _YoutubePlayVideoScreenState extends State<YoutubePlayVideoScreen> {
  late YoutubePlayerController _controller;
  //final String _videoUrl = 'https://youtu.be/3vJ-nHTX9iI';

  @override
  void initState() {
    super.initState();
    _setupYoutubePlayer(widget.videoUrl);
  }

  void _setupYoutubePlayer(String s ) {
    final videoId = YoutubePlayer.convertUrlToId(s);
    _controller = YoutubePlayerController(
      initialVideoId: videoId ?? '',
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Google Drive Video'),
      // ),
      body: Column(
        children: [
          Expanded(
            child: YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.blueAccent,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}