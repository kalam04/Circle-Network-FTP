import 'package:better_player/better_player.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Better extends StatefulWidget {
  var name,url,Cat_id,id,data;
  Better({this.name,this.url,this.Cat_id,this.id,this.data});
  @override
  _BetterState createState() => _BetterState(name,url,Cat_id,id,data);
}

class _BetterState extends State<Better> {

  BetterPlayerController _betterPlayerController;

  final spinkit = SpinKitWave(
    itemBuilder: (BuildContext context, int index) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: index.isEven ? Colors.yellow[200] : Colors.grey,
        ),
      );
    },
  );

  _BetterState(name, url, cat_id, id, data);

  var next,previous;
  @override
  Widget build(BuildContext context) {

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
      appBar: AppBar(
        title: Text("Example player"),
      ),
      // body: BetterPlayer.network(
      //   widget.url.toString(),
      //   betterPlayerConfiguration: BetterPlayerConfiguration(
      //     aspectRatio: 16 / 9,
      //   ),
      // ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: BetterPlayer.network(
                widget.url.toString(),
                betterPlayerConfiguration: BetterPlayerConfiguration(
                  aspectRatio: 16 / 9,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                child: Row(
                  children: [
                    InkWell(
                      onTap: (){
                        setState(() {
                          widget.url=widget.data[widget.Cat_id]["movies"][next]["media"].toString();
                        });
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => Playvideo1(name1: widget.data[widget.Cat_id]["movies"][next]["name"].toString(),
                        //           url1: widget.data[widget.Cat_id]["movies"][next]["media"].toString(),
                        //           flickManager: flickManager,
                        //         )));
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
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => Playvideo1(name1: widget.data[widget.Cat_id]["movies"][next]["name"].toString(),
                        //           url1: widget.data[widget.Cat_id]["movies"][next]["media"].toString(),
                        //           flickManager: flickManager,
                        //         )));
                        setState(() {
                          widget.url=widget.data[widget.Cat_id]["movies"][next]["media"].toString();
                        });
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