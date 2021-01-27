import 'dart:async';
import 'dart:typed_data';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';




class MyAppScaffold extends StatefulWidget {
  var name,url,Cat_id,id,data;
  MyAppScaffold({this.name,this.url,this.Cat_id,this.id,this.data});
  @override
  State<StatefulWidget> createState() => MyAppScaffoldState(name,url,Cat_id,id,data);
}

class MyAppScaffoldState extends State<MyAppScaffold> {
  // String initUrl =
  //     "http://index.circleftp.net/FILE/English%20Movies/2013/The%20Wolverine%20%282013%29%201080p%20EXTENDED%20BluRay%20x264/The%20Wolverine%20%282013%29%201080p%20EXTENDED%20BluRay%20x264.mkv";
  //

  String changeUrl =
      "http://index.circleftp.net/FILE/English%20Movies/2013/A.Teacher.2013.1080p.WEBRip.x264-RARBG/A.Teacher.2013.1080p.WEBRip.x264-RARBG.mp4";

  Uint8List image;
  VlcPlayerController _videoViewController;
  bool isPlaying = true;
  double sliderValue = 0.0;
  double currentPlayerTime = 0;
  double volumeValue = 100;
  String position = "";
  String duration = "";
  int numberOfCaptions = 0;
  int numberOfAudioTracks = 0;
  bool isBuffering = true;
  bool getCastDeviceBtnEnabled = false;
  var h=250.0;
  var fullscreen=false;
  var isVisibility=false;
  var next,previous;
  var AppbarText;
  var show=true;

  var _scaffoldKey = new GlobalKey<ScaffoldState>();

  MyAppScaffoldState(name, url, cat_id, id, data);

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
  void initState() {
    AppbarText=widget.data[widget.Cat_id]["movies"][widget.id]["name"].toString();

    _videoViewController = new VlcPlayerController(onInit: () {
      _videoViewController.play();
    });
    _videoViewController.addListener(() {
      if (!this.mounted) return;
      if (_videoViewController.initialized) {
        var oPosition = _videoViewController.position;
        var oDuration = _videoViewController.duration;
        if (oDuration.inHours == 0) {
          var strPosition = oPosition.toString().split('.')[0];
          var strDuration = oDuration.toString().split('.')[0];
          position =
          "${strPosition.split(':')[1]}:${strPosition.split(':')[2]}";
          duration =
          "${strDuration.split(':')[1]}:${strDuration.split(':')[2]}";
        } else {
          position = oPosition.toString().split('.')[0];
          duration = oDuration.toString().split('.')[0];
        }
        sliderValue = _videoViewController.position.inSeconds.toDouble();
        numberOfCaptions = _videoViewController.spuTracksCount;
        numberOfAudioTracks = _videoViewController.audioTracksCount;

        switch (_videoViewController.playingState) {
          case PlayingState.PAUSED:
            setState(() {
              isBuffering = false;
            });
            break;

          case PlayingState.STOPPED:
            setState(() {
              isPlaying = false;
              isBuffering = false;
            });
            break;
          case PlayingState.BUFFERING:
            setState(() {
              isBuffering = true;
            });
            break;
          case PlayingState.PLAYING:
            setState(() {
              isBuffering = false;
            });
            break;
          case PlayingState.ERROR:
            setState(() {});
            print("VLC encountered error");
            break;
          default:
            setState(() {});
            break;
        }
      }
    });
    super.initState();
  }


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
    var subHeight,playHeight;
    subHeight=MediaQuery.of(context).size.height/40;
    playHeight=MediaQuery.of(context).size.height/40;


    if(MediaQuery.of(context).orientation==Orientation.portrait){
      return new Scaffold(

        appBar: fullscreen ? null : new AppBar(
          title:  Text(AppbarText.toString()),
        ),
        body: Builder(builder: (context) {
          return Container(
            color: Colors.black,
            child: InkWell(
              onTap: () {
                setState(() {
                  isVisibility = true;
                });

                Timer(Duration(seconds: 20), () {
                  // 5s over, navigate to a new page
                  setState(() {
                    isVisibility = false;
                  });
                });
              },
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  Container(
                    height: h,
                    child: Stack(
                      children: [
                        Positioned(
                          child: SizedBox(
                            height: h,
                            child: new VlcPlayer(
                              aspectRatio: 16 / 9,
                              url: widget.url.toString(),
                              isLocalMedia: false,
                              controller: _videoViewController,
                              // Play with vlc options
                              options: [
                                '--quiet',
//                '-vvv',
                                '--no-drop-late-frames',
                                '--no-skip-frames',
                                '--rtsp-tcp',
                              ],
                              hwAcc: HwAcc.DISABLED,
                              // or {HwAcc.AUTO, HwAcc.DECODING, HwAcc.FULL}
                              placeholder: Container(
                                height: h,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    CircularProgressIndicator()
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: isVisibility,
                          child: Positioned(
                            bottom: 0,
                            child: Container(

                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(position,style: TextStyle(color: Colors.white),),
                                        Expanded(
                                          child: Slider(
                                            activeColor: Colors.blue,
                                            value: sliderValue,
                                            min: 0.0,
                                            max:
                                            _videoViewController.duration ==
                                                null
                                                ? (sliderValue + 1)
                                                : _videoViewController
                                                .duration.inSeconds
                                                .toDouble(),
                                            onChanged: (progress) {
                                              setState(() {
                                                sliderValue =
                                                    progress.floor().toDouble();
                                              });
                                              //convert to Milliseconds since VLC requires MS to set time
                                              _videoViewController.setTime(
                                                  sliderValue.toInt() * 1000);
                                            },
                                          ),
                                        ),
                                        Text(duration,style: TextStyle(color: Colors.white)),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: playHeight,
                                    width: MediaQuery.of(context).size.width,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        FlatButton(
                                            child: isPlaying
                                                ? Icon(
                                                    Icons.pause_circle_outline,
                                                    color: Colors.blueGrey,
                                                  )
                                                : Icon(
                                                    Icons.play_circle_outline,
                                                    color: Colors.blueGrey,
                                                  ),
                                            onPressed: () =>
                                                {playOrPauseVideo()}),
                                        FlatButton(
                                          onPressed: () {
                                            SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
                                            if (fullscreen == false) {
                                              setState(() {
                                                h = MediaQuery.of(context)
                                                    .size
                                                    .height;

                                                fullscreen = true;
                                                show=false;


                                              });
                                            } else {
                                              setState(() {
                                                h = 250.0;
                                                fullscreen = false;
                                                show=true;
                                              });
                                            }
                                          },
                                          child: fullscreen
                                              ? Icon(
                                                  Icons.fullscreen_exit,
                                                  color: Colors.blueGrey,
                                                )
                                              : Icon(
                                                  Icons.fullscreen,
                                                  color: Colors.blueGrey,
                                                ),
                                        ),
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: isVisibility,
                          child: Positioned(
                            top: 0,
                            child: Container(
                              height: subHeight,
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  RaisedButton(
                                    color: Colors.transparent,
                                    child: Text('Get Subtitle Tracks',style: TextStyle(color: Colors.white)),
                                    onPressed: () {
                                      _getSubtitleTracks();
                                    },
                                  ),
                                  RaisedButton(
                                    color: Colors.transparent,
                                    child: Text('Get Audio Tracks',style: TextStyle(color: Colors.white)),
                                    onPressed: () {
                                      _getAudioTracks();
                                    },
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: isVisibility,
                          child: Positioned(
                            top: h/2-subHeight,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      _videoViewController.setTime(
                                          sliderValue.toInt() * 1000 - 10000);
                                    });
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 100),
                                    child: Container(

                                        child: Icon(Icons.fast_rewind,color: Colors.blue,)),
                                  ),
                                ),
                                InkWell(
                                    onTap: () {
                                      setState(() {
                                        _videoViewController.setTime(
                                            sliderValue.toInt() * 1000 + 10000);
                                      });
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 100.0),
                                      child: Container(

                                        child: Icon(Icons.fast_forward,color: Colors.blue,),
                                      ),
                                    ),
                                  ),
                                ],
                            ),),
                          ),
                        )


                        // Visibility(
                        //   visible: isVisibility,
                        //   child: Positioned(
                        //     top: subHeight+20,
                        //     left: 0,
                        //     child: InkWell(
                        //       onDoubleTap: (){
                        //         _videoViewController.setTime(
                        //             sliderValue.toInt() * 1000-10000);
                        //       },
                        //       child: Container(
                        //         height: h-subHeight-playHeight-20,
                        //         width: MediaQuery.of(context).size.width/2,
                        //         child: Padding(
                        //           padding: const EdgeInsets.only(left: 50.0),
                        //           child: InkWell(
                        //               onTap: (){
                        //                 _videoViewController.setTime(
                        //                     sliderValue.toInt() * 1000-10000);
                        //               },
                        //               child: Icon(Icons.fast_rewind,color: Colors.white,)),
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // Visibility(
                        //   visible: isVisibility,
                        //   child: Positioned(
                        //     top: subHeight+20,
                        //     right: 0,
                        //     child: InkWell(
                        //       onDoubleTap: (){
                        //         setState(() {
                        //           _videoViewController.setTime(
                        //               sliderValue.toInt() * 1000+10000);
                        //         });
                        //       },
                        //         child: Container(
                        //           height: h-subHeight-playHeight-20,
                        //           width: MediaQuery.of(context).size.width/2,
                        //           child: Padding(
                        //             padding: const EdgeInsets.only(right: 50.0),
                        //             child: InkWell(
                        //                 onTap: (){
                        //                   setState(() {
                        //                     _videoViewController.setTime(
                        //                         sliderValue.toInt() * 1000+10000);
                        //                   });
                        //                 },
                        //                 child: Icon(Icons.fast_forward,color: Colors.white,)),
                        //           ),
                        //         )),
                        //   ),
                        // )
                      ],
                    ),
                  ),

                  Visibility(
                    visible: show,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: (){
                                setState(() {
                                  AppbarText=widget.data[widget.Cat_id]["movies"][previous]["name"].toString();
                                });

                                _videoViewController.setStreamUrl(widget.data[widget.Cat_id]["movies"][previous]["media"].toString());
                                // if(previous==0){
                                //   next=next-1;
                                //   previous=widget.data[widget.Cat_id]["movies"].length-1;
                                //   // print(previous);
                                // }else{
                                //   next=next-1;
                                //   previous=previous-1;
                                // }

                              },
                              child: Container(
                                height: 200,
                                width:
                                MediaQuery.of(context).size.width * .4,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
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
                                setState(() {
                                  AppbarText=widget.data[widget.Cat_id]["movies"][next]["name"].toString();
                                });

                                _videoViewController.setStreamUrl(widget.data[widget.Cat_id]["movies"][next]["media"].toString());
                                // if(next==widget.data[widget.Cat_id]["movies"].length-1){
                                //   next=0;
                                //   previous=previous+1;
                                // }else{
                                //   next=next+1;
                                //   previous=previous+1;
                                // }
                              },
                              child: Container(
                                height: 200,
                                width:
                                MediaQuery.of(context).size.width * .4,
                                child: Padding(
                                  padding: const EdgeInsets.all( 8.0),
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
                  ),
                  Visibility(
                    visible: show,
                    child: Padding(
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
                            return InkWell(
                              onTap: (){
                                setState(() {
                                 AppbarText= widget.data[widget.Cat_id]["movies"][index]["name"].toString();
                                });

                                _videoViewController.setStreamUrl(widget.data[widget.Cat_id]["movies"][index]["media"].toString());
                              },
                              child: Container(

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
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  )

                  // Row(
                  //   children: [
                  //     FlatButton(
                  //       child: Text("Change URL"),
                  //       onPressed: () =>
                  //           _videoViewController.setStreamUrl(changeUrl),
                  //     ),
                  //   ],
                  // ),
                  // Divider(height: 1),
                ],
              ),
            ),
          );
        }),
      );
    }else{
      setState(() {
        SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
      });
      return new Scaffold(

        // appBar: fullscreen ? null :  AppBar(
        //   title: const Text('Plugin example app'),
        // ),
        body: Builder(builder: (context) {
          return Container(
            color: Colors.black,
           // width: MediaQuery.of(context).size.width,
            child: InkWell(
              onTap: () {
                setState(() {
                  isVisibility = true;
                });

                Timer(Duration(seconds: 10), () {
                  // 5s over, navigate to a new page
                  setState(() {
                    isVisibility = false;
                  });
                });
              },
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height,
                    child: Stack(
                      children: [
                        Positioned(
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height,
                            child: new VlcPlayer(
                              aspectRatio: 16 / 9,
                              url: widget.url.toString(),
                              isLocalMedia: false,
                              controller: _videoViewController,
                              // Play with vlc options
                              options: [
                                '--quiet',
//                '-vvv',
                                '--no-drop-late-frames',
                                '--no-skip-frames',
                                '--rtsp-tcp',
                              ],
                              hwAcc: HwAcc.DISABLED,
                              // or {HwAcc.AUTO, HwAcc.DECODING, HwAcc.FULL}
                              placeholder: Container(
                                //height: MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[CircularProgressIndicator()],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: isVisibility,
                          child: Positioned(
                            width: MediaQuery.of(context).size.width,
                            bottom: 0,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(position,style: TextStyle(color: Colors.white),),
                                        Expanded(
                                          child: Slider(
                                            activeColor: Colors.blue,
                                            value: sliderValue,
                                            min: 0.0,
                                            max: _videoViewController.duration == null
                                                ? (sliderValue + 1)
                                                : _videoViewController.duration.inSeconds
                                                .toDouble(),
                                            onChanged: (progress) {
                                              setState(() {
                                                sliderValue = progress.floor().toDouble();
                                              });
                                              //convert to Milliseconds since VLC requires MS to set time
                                              _videoViewController
                                                  .setTime(sliderValue.toInt() * 1000);
                                            },
                                          ),
                                        ),
                                        Text(duration,style: TextStyle(color: Colors.white),),

                                      ],
                                    ),
                                  ),
                                  Container(

                                    width: MediaQuery.of(context).size.width,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        FlatButton(
                                            child: isPlaying
                                                ? Icon(Icons.pause_circle_outline,
                                              color: Colors.blueGrey,)
                                                : Icon(Icons.play_circle_outline,
                                              color: Colors.blueGrey,),
                                            onPressed: () => {playOrPauseVideo()}),
                                        // FlatButton(
                                        //   onPressed: () {
                                        //
                                        //     if(fullscreen==false){
                                        //       setState(() {
                                        //
                                        //
                                        //         SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
                                        //         fullscreen=true;
                                        //       });
                                        //     }else{
                                        //       setState(() {
                                        //
                                        //         fullscreen=false;
                                        //       });
                                        //     }
                                        //
                                        //   },
                                        //   child: fullscreen
                                        //       ? Icon(
                                        //           Icons.fullscreen_exit,
                                        //           color: Colors.blueGrey,
                                        //         )
                                        //       : Icon(
                                        //           Icons.fullscreen,
                                        //           color: Colors.blueGrey,
                                        //         ),
                                        // ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: isVisibility,
                          child: Positioned(
                            top: 0,
                            child: Container(

                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  RaisedButton(
                                    color:Colors.transparent,
                                    child: Text('Get Subtitle Tracks',style: TextStyle(color: Colors.white),),
                                    onPressed: () {
                                      _getSubtitleTracks();
                                    },
                                  ),
                                  RaisedButton(
                                    color:Colors.transparent,
                                    child: Text('Get Audio Tracks',style: TextStyle(color: Colors.white),),
                                    onPressed: () {
                                      _getAudioTracks();
                                    },
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: isVisibility,
                          child: Positioned(
                            top: MediaQuery.of(context).size.height/2-20,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        _videoViewController.setTime(
                                            sliderValue.toInt() * 1000 - 10000);
                                      });
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 100),
                                      child: Container(

                                          child: Icon(Icons.fast_rewind,color: Colors.blueGrey,size: 50,)),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        _videoViewController.setTime(
                                            sliderValue.toInt() * 1000 + 10000);
                                      });
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 100.0),
                                      child: Container(

                                        child: Icon(Icons.fast_forward,color: Colors.blueGrey,size: 50,),
                                      ),
                                    ),
                                  ),
                                ],
                              ),),
                          ),
                        )
                        // Visibility(
                        //   visible: isVisibility,
                        //   child: Positioned(
                        //     top: subHeight+10,
                        //     left: 0,
                        //     child: InkWell(
                        //       onDoubleTap: (){
                        //         _videoViewController.setTime(
                        //             sliderValue.toInt() * 1000-10000);
                        //       },
                        //       child: Container(
                        //         height: MediaQuery.of(context).size.height-subHeight-playHeight-20,
                        //         width: MediaQuery.of(context).size.width/2,
                        //         child: Padding(
                        //           padding: const EdgeInsets.only(left: 50.0),
                        //           child: InkWell(
                        //               onTap: (){
                        //                 _videoViewController.setTime(
                        //                     sliderValue.toInt() * 1000-10000);
                        //               },
                        //               child: Icon(Icons.fast_rewind,color: Colors.white,)),
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // Visibility(
                        //   visible: isVisibility,
                        //   child: Positioned(
                        //     top: subHeight+10,
                        //     right: 0,
                        //     child: InkWell(
                        //         onDoubleTap: (){
                        //           setState(() {
                        //             _videoViewController.setTime(
                        //                 sliderValue.toInt() * 1000+10000);
                        //           });
                        //         },
                        //         child: Container(
                        //           height: MediaQuery.of(context).size.height-subHeight-playHeight-20,
                        //           width: MediaQuery.of(context).size.width/2,
                        //           child: Padding(
                        //             padding: const EdgeInsets.only(right: 50.0),
                        //             child: InkWell(
                        //                 onTap: (){
                        //                   setState(() {
                        //                     _videoViewController.setTime(
                        //                         sliderValue.toInt() * 1000+10000);
                        //                   });
                        //                 },
                        //                 child: Icon(Icons.fast_forward,color: Colors.white,)),
                        //           ),
                        //         )),
                        //   ),
                        // )
                      ],
                    ),
                  ),




                  // Row(
                  //   children: [
                  //     FlatButton(
                  //       child: Text("Change URL"),
                  //       onPressed: () =>
                  //           _videoViewController.setStreamUrl(changeUrl),
                  //     ),
                  //   ],
                  // ),
                  // Divider(height: 1),




                ],
              ),
            ),
          );
        }),
      );
    }

  }

  @override
  void dispose() {
    _videoViewController.dispose();
    super.dispose();
  }

  void playOrPauseVideo() {
    String state = _videoViewController.playingState.toString();

    if (state == "PlayingState.PLAYING") {
      _videoViewController.pause();
      setState(() {
        isPlaying = false;
      });
    } else {
      _videoViewController.play();
      setState(() {
        isPlaying = true;
      });
    }
  }

  void _getSubtitleTracks() async {
    if (_videoViewController.playingState.toString() != "PlayingState.PLAYING")
      return;
    Map<dynamic, dynamic> subtitleTracks =
    await _videoViewController.getSpuTracks();
    //
    if (subtitleTracks != null && subtitleTracks.length > 0) {
      int selectedSubId = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Select Subtitle"),
            content: Container(
              width: double.maxFinite,
              height: 250,
              child: ListView.builder(
                itemCount: subtitleTracks.keys.length + 1,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      index < subtitleTracks.keys.length
                          ? subtitleTracks.values.elementAt(index).toString()
                          : 'Disable',
                    ),
                    onTap: () {
                      Navigator.pop(
                        context,
                        index < subtitleTracks.keys.length
                            ? subtitleTracks.keys.elementAt(index)
                            : -1,
                      );
                    },
                  );
                },
              ),
            ),
          );
        },
      );
      if (selectedSubId != null)
        await _videoViewController.setSpuTrack(selectedSubId);
    }
  }

  void _getAudioTracks() async {
    if (_videoViewController.playingState.toString() != "PlayingState.PLAYING")
      return;

    Map<dynamic, dynamic> audioTracks =
    await _videoViewController.getAudioTracks();
    //
    if (audioTracks != null && audioTracks.length > 0) {
      int selectedAudioTrackId = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Select Audio"),
            content: Container(
              width: double.maxFinite,
              height: 250,
              child: ListView.builder(
                itemCount: audioTracks.keys.length + 1,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      index < audioTracks.keys.length
                          ? audioTracks.values.elementAt(index).toString()
                          : 'Disable',
                    ),
                    onTap: () {
                      Navigator.pop(
                        context,
                        index < audioTracks.keys.length
                            ? audioTracks.keys.elementAt(index)
                            : -1,
                      );
                    },
                  );
                },
              ),
            ),
          );
        },
      );
      if (selectedAudioTrackId != null)
        await _videoViewController.setAudioTrack(selectedAudioTrackId);
    }
  }



  void _createCameraImage() async {
    Uint8List file = await _videoViewController.takeSnapshot();
    setState(() {
      image = file;
    });
  }
}

