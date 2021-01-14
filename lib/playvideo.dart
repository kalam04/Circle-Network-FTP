import 'package:cached_network_image/cached_network_image.dart';
import 'package:circle_network_ftp/Playvideo1.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;
import 'package:mx_player_plugin/mx_player_plugin.dart';


class Playvideo extends StatefulWidget {
  var name,url,Cat_id,id,data;
  Playvideo({this.name,this.url,this.Cat_id,this.id,this.data});

  @override
  _PlayvideoState createState() => _PlayvideoState(name,url,Cat_id,id,data);
}

class _PlayvideoState extends State<Playvideo> {

  FlickManager flickManager;

  _PlayvideoState(name, url, cat_id, id, data);

  var next,previous;




  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController:
      VideoPlayerController.network(widget.url.toString()),
      autoInitialize: true,
      autoPlay: false,
      

    );
  }

  final spinkit = SpinKitWave(
    itemBuilder: (BuildContext context, int index) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: index.isEven ? Colors.yellow[200] : Colors.grey,
        ),
      );
    },
  );


  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    if(widget.id==0){
      next=widget.id+1;
      previous=widget.data[widget.Cat_id]["movies"].length-1;
     // print(previous);
    }else{
      next=widget.id+1;
      previous=widget.id-1;
    }
    if(widget.id==widget.data[widget.Cat_id]["movies"].length-1){
      next=0;
      previous=widget.id-1;
    }
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text("Circle FTP"),backgroundColor: Colors.black,centerTitle: true,),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: FlickVideoPlayer(
                  flickManager: flickManager
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                child: Row(
                  children: [
                    InkWell(
                      onTap: (){

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Playvideo1(name1: widget.data[widget.Cat_id]["movies"][next]["name"].toString(),
                                  url1: widget.data[widget.Cat_id]["movies"][next]["media"].toString(),
                                  flickManager: flickManager,
                                )));
                      },
                      child: Container(
                        height: 200,
                        width:
                        MediaQuery.of(context).size.width * .4,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: widget.data[widget.Cat_id]["movies"][previous]["banner"].toString(),
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) =>
                                Center(
                                  child: spinkit,
                                ),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Playvideo1(name1: widget.data[widget.Cat_id]["movies"][next]["name"].toString(),
                                  url1: widget.data[widget.Cat_id]["movies"][next]["media"].toString(),
                                  flickManager: flickManager,
                                )));
                      },
                      child: Container(
                        height: 200,
                        width:
                        MediaQuery.of(context).size.width * .4,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: widget.data[widget.Cat_id]["movies"][next]["banner"].toString(),
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) =>
                                Center(
                                  child: spinkit,
                                ),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(

                width: MediaQuery.of(context).size.width,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    childAspectRatio: .7,
                  ),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: widget.data[widget.Cat_id]["movies"].length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(

                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: widget.data[widget.Cat_id]["movies"][index]
                                ["banner"]
                            .toString(),
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => Center(
                          child: spinkit,
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    );
                  },
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}


