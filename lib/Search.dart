import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'playvideo.dart';

class Search extends StatefulWidget {
  var movie_name;

  Search({this.movie_name});

  @override
  _SearchState createState() => _SearchState(movie_name);
}

class _SearchState extends State<Search> {
  _SearchState(movie_name);

  var url1 = "http://circleftp.net/custom_search/?value=";
  var result;

  // static const spinkit = SpinKitRotatingCircle(
  //   color: Colors.white,
  //   size: 50.0,
  // );

  final spinkit = SpinKitWave(
    itemBuilder: (BuildContext context, int index) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: index.isEven ? Colors.yellow[200] : Colors.grey,
        ),
      );
    },
  );

  // final spinkit = SpinKitSquareCircle(
  //   color: Colors.white,
  //   size: 50.0,
  //   controller: AnimationController(vsync: this, duration: const Duration(milliseconds: 1200)),
  // );



  Future get_search_value() async {
    var url = url1 + widget.movie_name;
    var respons = await http.get(url.toString());

    setState(() {
      result = json.decode(respons.body);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.get_search_value();
  }

  @override
  Widget build(BuildContext context) {
    // print(result.length);
    if(result==null|| result==0){
      return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("Circle FPT"),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height*.2,
            width: MediaQuery.of(context).size.width*.2,
            color: Colors.deepPurpleAccent[50],
      //       child: CircularProgressIndicator(
      //     //value: downloadProgress.progress,
      //     valueColor: AlwaysStoppedAnimation<Color>(
      //     Colors.limeAccent[700],
      //     ),
      //     strokeWidth: 5,
      //
      //     //backgroundColor: Colors.cyan,
      // ),
            child: spinkit,
          ),
        ),
      );
    }else{
      return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("Circle FPT"),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body: Container(
          color: Colors.deepPurpleAccent[50],
          child: ListView.builder(

              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: result == null ? 0 : result.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Playvideo(
                              name: result[index]["name"].toString(),
                              url: result[index]["media"].toString(),
                            )));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width * .4,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: result[index]["banner"].toString(),
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => Center(
                            // child: CircularProgressIndicator(
                            //   //value: downloadProgress.progress,
                            //   valueColor: AlwaysStoppedAnimation<Color>(
                            //     Colors.limeAccent[700],
                            //   ),
                            //   strokeWidth: 5,
                            //
                            //   //backgroundColor: Colors.cyan,
                            // ),
                                child: spinkit,
                          ),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ),
      );
    }

  }
}
