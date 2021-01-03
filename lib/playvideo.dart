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
      appBar: AppBar(title: Text("Video Player"),),
      body: Container(
        child: Column(
          children: [
            FlickVideoPlayer(
                flickManager: flickManager
            ),

          ],
        ),
      ),
    );
  }
}

//
// import 'package:flutter/material.dart';
// import 'package:flutter_vlc_player/flutter_vlc_player.dart';
//
// class ExampleVideo extends StatefulWidget {
//   @override
//   _ExampleVideoState createState() => _ExampleVideoState();
// }
//
// class _ExampleVideoState extends State<ExampleVideo> {
//    String urlToStreamVideo = 'http://distribution.bbb3d.renderfarming.net/video/mp4/bbb_sunflower_1080p_60fps_normal.mp4';
//    VlcPlayerController controller = new VlcPlayerController(
//     // Start playing as soon as the video is loaded.
//     onInit: (){
//       controller.play();
//     }
//
//   );
//
//    @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     VlcPlayerController controller = new VlcPlayerController(
//       // Start playing as soon as the video is loaded.
//
//
//     );
//   }
//   final int playerWidth = 640;
//   final int playerHeight = 360;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SizedBox(
//             height: 640,
//             width: 360,
//             child: new VlcPlayer(
//               aspectRatio: 16 / 9,
//               url: urlToStreamVideo,
//               controller: controller,
//               placeholder: Center(child: CircularProgressIndicator()),
//             )
//         )
//     );
//   }
// }


//
//
// class SamplePlayer extends StatefulWidget {
//   var name,url;
//   SamplePlayer({this.name,this.url}) ;
//
//
//   @override
//   _SamplePlayerState createState() => _SamplePlayerState(name,url);
// }
//
// class _SamplePlayerState extends State<SamplePlayer> {
//   FlickManager flickManager;
//
//   _SamplePlayerState(name, url);
//   @override
//   void initState() {
//     super.initState();
//     flickManager = FlickManager(
//       videoPlayerController:
//       VideoPlayerController.network(widget.url.toString()),
//     );
//   }
//
//
//   @override
//   void dispose() {
//     flickManager.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Video Player"),),
//       body: Container(
//         child: Column(
//           children: [
//             FlickVideoPlayer(
//                 flickManager: flickManager
//             ),
//             Container(
//               child: Text("what the new"),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
