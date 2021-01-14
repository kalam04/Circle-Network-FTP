import 'package:cached_network_image/cached_network_image.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;


class Playvideo1 extends StatefulWidget {
  var name1,url1;
  FlickManager flickManager;
  Playvideo1({this.name1,this.url1,this.flickManager});

  @override
  _Playvideo1State createState() => _Playvideo1State(name1,url1,flickManager);
}

class _Playvideo1State extends State<Playvideo1> {

  var next,previous;
  FlickManager flickManager1;

  final spinkit = SpinKitWave(
    itemBuilder: (BuildContext context, int index) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: index.isEven ? Colors.yellow[200] : Colors.grey,
        ),
      );
    },
  );

  _Playvideo1State(name1, url1, flickManager);


  void initState() {

    super.initState();
    flickManager1 = FlickManager(
      videoPlayerController:
      VideoPlayerController.network(widget.url1.toString()),
    );
  }

  @override
  void dispose() {
    flickManager1.dispose();
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
                  flickManager: flickManager1,

              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 8.0),
            //   child: Container(
            //     child: Row(
            //       children: [
            //         Container(
            //           height: 200,
            //           width:
            //           MediaQuery.of(context).size.width * .4,
            //           child: Padding(
            //             padding: const EdgeInsets.only(left: 8.0),
            //             child: CachedNetworkImage(
            //               fit: BoxFit.cover,
            //               imageUrl: widget.data[widget.Cat_id]["movies"][previous]["banner"].toString(),
            //               progressIndicatorBuilder:
            //                   (context, url, downloadProgress) =>
            //                   Center(
            //                     child: spinkit,
            //                   ),
            //               errorWidget: (context, url, error) =>
            //                   Icon(Icons.error),
            //             ),
            //           ),
            //         ),
            //         Container(
            //           height: 200,
            //           width:
            //           MediaQuery.of(context).size.width * .4,
            //           child: Padding(
            //             padding: const EdgeInsets.only(left: 8.0),
            //             child: CachedNetworkImage(
            //               fit: BoxFit.cover,
            //               imageUrl: widget.data[widget.Cat_id]["movies"][next]["banner"].toString(),
            //               progressIndicatorBuilder:
            //                   (context, url, downloadProgress) =>
            //                   Center(
            //                     child: spinkit,
            //                   ),
            //               errorWidget: (context, url, error) =>
            //                   Icon(Icons.error),
            //             ),
            //           ),
            //         ),
            //
            //       ],
            //     ),
            //   ),
            // ),

          ],
        ),
      ),
    );
  }
}


