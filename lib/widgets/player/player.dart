import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
// import 'dart:async';

class VideoPlayerWidget extends StatefulWidget {
  VideoPlayerWidget({Key key, this.videoUrl}) : super(key: key);

  final String videoUrl;

  @override
  _VideoPlayerWidget createState() {
    return _VideoPlayerWidget(videoUrl);
  }
}

class _VideoPlayerWidget extends State<VideoPlayerWidget> {
  String videoUrl;

  _VideoPlayerWidget(this.videoUrl);

  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.network(
        'http://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4')
      ..initialize().then((_) {
        setState(() {
          _controller.play();
        });
      });
    _controller.setLooping(true);
    _controller.setVolume(10);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return playerWidget();
  }

  Widget playerWidget() {
    return _controller.value.initialized ? playerContainer() : emptyContainer();
  }

  Widget emptyContainer() {
    return Container(
      height: 200.0,
      width: 200.0,
      child: FractionallySizedBox(
        heightFactor: 0.1,
        widthFactor: 0.1,
        child: CircularProgressIndicator(
          backgroundColor: Colors.blueGrey,
        ),
      ),
      color: Colors.amber.withOpacity(0.2),
    );
  }

  Widget playerContainer() {
    return GestureDetector(
        onTap: () {
          playerPlayPause();
        },
        child: Container(
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            height: 200.0 / _controller.value.aspectRatio,
            width: 200.0,
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            )));
  }

  Widget controlButtons() {
    return FractionallySizedBox(
        widthFactor: 1.0,
        child: Row(
            children: [
              playButton(),
              SizedBox(
                width: 20.0,
              ),
              setSpeedx2(),
              SizedBox(
                width: 20.0,
              ),
              setNormalSpeed(),
            ],
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center));
  }

  Widget setSpeedx2() {
    return FloatingActionButton(
        child: Text('2x'),
        onPressed: () {
          setState(() {
            _controller.setPlaybackSpeed(2.0);
          });
        });
  }

  Widget setNormalSpeed() {
    return FloatingActionButton(
        child: Text('1x'),
        onPressed: () {
          setState(() {
            _controller.setPlaybackSpeed(1.0);
          });
        });
  }

  Widget playButton() {
    return FloatingActionButton(
        child:
            Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
        onPressed: () {
          setState(() {
            playerPlayPause();
          });
        });
  }

  void playerPlayPause() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
      } else {
        _controller.play();
      }
    });

    print('$_controller.value.isPlaying');
  }
}
