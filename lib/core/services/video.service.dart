import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Video extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  Video({required this.videoPlayerController});
  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {
  late ChewieController chewieController;
  @override
  void initState() {
    super.initState();
    chewieController = ChewieController(
        videoPlayerController: widget.videoPlayerController,
        looping: false,
        aspectRatio: 16 / 9,
        autoInitialize: false);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Chewie(
        controller: chewieController,
      ),
    );
  }

  @override
  void dispose() {
    widget.videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }
}

class VideoPlayerService extends StatefulWidget {
  final String trailerUrl;
  VideoPlayerService({required this.trailerUrl});
  @override
  _VideoPlayerServiceState createState() => _VideoPlayerServiceState();
}

class _VideoPlayerServiceState extends State<VideoPlayerService> {
  @override
  Widget build(BuildContext context) {
    return Video(
      videoPlayerController: VideoPlayerController.network(widget.trailerUrl),
    );
  }
}
