import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';




class ChewieDemo extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const ChewieDemo({this.title = 'Chewie Demo'});

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _ChewieDemoState();
  }
}

class _ChewieDemoState extends State<ChewieDemo> {
  TargetPlatform _platform;
  VideoPlayerController _videoPlayerController1;
  VideoPlayerController _videoPlayerController2;
  ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _videoPlayerController2.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  Future<void> initializePlayer() async {
    _videoPlayerController1 = VideoPlayerController.network(
        'http://index.circleftp.net/FILE/English%20Movies/2013/The%20Wolverine%20%282013%29%201080p%20EXTENDED%20BluRay%20x264/The%20Wolverine%20%282013%29%201080p%20EXTENDED%20BluRay%20x264.mkv');
    await _videoPlayerController1.initialize();

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      autoPlay: true,
      looping: true,
      // Try playing around with some of these other options:

      showControls: false,
      materialProgressColors: ChewieProgressColors(
        playedColor: Colors.red,
        handleColor: Colors.blue,
        backgroundColor: Colors.grey,
        bufferedColor: Colors.lightGreen,
      ),
      placeholder: Container(
        color: Colors.grey,
      ),
      autoInitialize: true,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: widget.title,
      theme: ThemeData.light().copyWith(
        platform: _platform ?? Theme.of(context).platform,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Center(
                child: _chewieController != null &&
                    _chewieController
                        .videoPlayerController.value.initialized
                    ? Chewie(
                  controller: _chewieController,
                )
                    : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(),
                    SizedBox(height: 20),
                    Text('Loading'),
                  ],
                ),
              ),
            ),
            FlatButton(
              onPressed: () {
                _chewieController.enterFullScreen();
              },
              child: const Text('Fullscreen'),
            ),
            // Row(
            //   children: <Widget>[
            //     Expanded(
            //       child: FlatButton(
            //         onPressed: () {
            //           setState(() {
            //             _chewieController.dispose();
            //             _videoPlayerController1.pause();
            //             _videoPlayerController1.seekTo(const Duration());
            //             _chewieController = ChewieController(
            //               videoPlayerController: _videoPlayerController1,
            //               autoPlay: true,
            //               looping: true,
            //             );
            //           });
            //         },
            //         child: const Padding(
            //           padding: EdgeInsets.symmetric(vertical: 16.0),
            //           child: Text("Landscape Video"),
            //         ),
            //       ),
            //     ),
            //     Expanded(
            //       child: FlatButton(
            //         onPressed: () {
            //           setState(() {
            //             _chewieController.dispose();
            //             _videoPlayerController2.pause();
            //             _videoPlayerController2.seekTo(const Duration());
            //             _chewieController = ChewieController(
            //               videoPlayerController: _videoPlayerController2,
            //               autoPlay: true,
            //               looping: true,
            //             );
            //           });
            //         },
            //         child: const Padding(
            //           padding: EdgeInsets.symmetric(vertical: 16.0),
            //           child: Text("Portrait Video"),
            //         ),
            //       ),
            //     )
            //   ],
            // ),
            // Row(
            //   children: <Widget>[
            //     Expanded(
            //       child: FlatButton(
            //         onPressed: () {
            //           setState(() {
            //             _platform = TargetPlatform.android;
            //           });
            //         },
            //         child: const Padding(
            //           padding: EdgeInsets.symmetric(vertical: 16.0),
            //           child: Text("Android controls"),
            //         ),
            //       ),
            //     ),
            //     Expanded(
            //       child: FlatButton(
            //         onPressed: () {
            //           setState(() {
            //             _platform = TargetPlatform.iOS;
            //           });
            //         },
            //         child: const Padding(
            //           padding: EdgeInsets.symmetric(vertical: 16.0),
            //           child: Text("iOS controls"),
            //         ),
            //       ),
            //     )
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}


