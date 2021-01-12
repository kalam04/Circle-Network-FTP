import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';


class Playvideo extends StatefulWidget {
  var name,url;
  Playvideo({this.name,this.url});

  @override
  _PlayvideoState createState() => _PlayvideoState(name,url);
}

class _PlayvideoState extends State<Playvideo> {
  _PlayvideoState(name, url);
  FlickManager flickManager;

  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController:
      VideoPlayerController.network(widget.url.toString()),
    );
  }


  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text("Circle FTP"),backgroundColor: Colors.black,centerTitle: true,),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: FlickVideoPlayer(
                  flickManager: flickManager
              ),
            ),

          ],
        ),
      ),
    );
  }
}


