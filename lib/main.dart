


//
// import 'package:circle_network_ftp/model.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'SecondPages.dart';
// import 'Welcome/welcome_screen.dart';
// import 'constants.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Auth',
//       theme: ThemeData(
//         primaryColor: kPrimaryColor,
//         scaffoldBackgroundColor: Colors.white,
//       ),
//       home: WelcomeScreen(),
//     );
//   }
// }










//
// import 'package:circle_network_ftp/model.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// void main() {
//   runApp(MyApp()
//   );
// }
//
// class MyApp extends StatefulWidget {
//   // This widget is the root of your application.
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//
//
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//
//
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     final providerData=Provider.of<Dataa>(context);
//     return ChangeNotifierProvider(
//       builder: (context) => Dataa(),
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("dfdkfmd"),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text(
//                 'You have pushed the button this many times:',
//               ),
//               Text(
//                 providerData.value.toString(),
//                 style: Theme.of(context).textTheme.headline4,
//               ),
//             ],
//           ),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: providerData.increment(),
//           tooltip: 'Increment',
//           child: Icon(Icons.add),
//         ), // This trailing comma makes auto-formatting nicer for build methods.
//       ),
//     );
//   }
// }


//
//
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Provider<MyModel>(//                              <--- Provider
//       create: (context) => MyModel(),
//       child: Consumer<MyModel>( //                           <--- MyModel Consumer
//           builder: (context, myModel, child) {
//             return ValueListenableProvider<String>.value( // <--- ValueListenableProvider
//               value: myModel.someValue,
//               child: MaterialApp(
//                 home: Scaffold(
//                   appBar: AppBar(title: Text('My App')),
//                   body: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//
//                       Container(
//                           padding: const EdgeInsets.all(20),
//                           color: Colors.green[200],
//                           child: Consumer<MyModel>( //       <--- Consumer
//                             builder: (context, myModel, child) {
//                               return RaisedButton(
//                                 child: Text('Do something'),
//                                 onPressed: (){
//                                   myModel.doSomething();
//                                 },
//                               );
//                             },
//                           )
//                       ),
//
//                       Container(
//                         padding: const EdgeInsets.all(35),
//                         color: Colors.blue[200],
//                         child: Consumer<String>(//           <--- String Consumer
//                           builder: (context, myValue, child) {
//                             return Text(myValue);
//                           },
//                         ),
//                       ),
//
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           }),
//     );
//   }
// }
//
// class MyModel { //                                             <--- MyModel
//   ValueNotifier<String> someValue = ValueNotifier('Hello'); // <--- ValueNotifier
//   void doSomething() {
//     someValue.value = 'Goodbye';
//     print(someValue.value);
//   }
// }


// ignore_for_file: public_member_api_docs, lines_longer_than_80_chars
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// /// This is a reimplementation of the default Flutter application using provider + [ChangeNotifier].
//
// void main() {
//   runApp(
//     /// Providers are above [MyApp] instead of inside it, so that tests
//     /// can use [MyApp] while mocking the providers
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => Counter()),
//       ],
//       child: const MyApp(),
//     ),
//   );
// }
//
// /// Mix-in [DiagnosticableTreeMixin] to have access to [debugFillProperties] for the devtool
// // ignore: prefer_mixin
// class Counter with ChangeNotifier, DiagnosticableTreeMixin {
//   int _count = 0;
//
//   int get count => _count;
//
//   void increment() {
//     _count++;
//     notifyListeners();
//   }
//
//   /// Makes `Counter` readable inside the devtools by listing all of its properties
//   @override
//   void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//     super.debugFillProperties(properties);
//     properties.add(IntProperty('count', count));
//   }
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatelessWidget {
//   const MyHomePage({Key key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Example'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: const <Widget>[
//             Text('You have pushed the button this many times:'),
//
//
//             Count(),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//
//         onPressed: () => context.read<Counter>().increment(),
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
//
// class Count extends StatelessWidget {
//   const Count({Key key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Text(
//
//         '${context.watch<Counter>().count}',
//         style: Theme.of(context).textTheme.headline4);
//   }
// }



//
// void main() => runApp(ChangeNotifierProvider(
//   create: (context) => MyModel(),
//     child: MyApp()));
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final providerdat=Provider.of<MyModel>(context);
//     return
//       MaterialApp(
//         home: Home(),
//         //  home: Scaffold(
//         //   appBar: AppBar(title: Text('My App')),
//         //   body: Column(
//         //     children: [
//         //       Row(
//         //         mainAxisAlignment: MainAxisAlignment.center,
//         //         children: <Widget>[
//         //
//         //           Container(
//         //               padding: const EdgeInsets.all(20),
//         //               color: Colors.green[200],
//         //               child:  RaisedButton(
//         //                     child: Text('Do something'),
//         //                     onPressed: (){
//         //                       providerdat.doSomething();
//         //                     },
//         //                   )
//         //               ),
//         //
//         //           Container(
//         //             padding: const EdgeInsets.all(35),
//         //             color: Colors.blue[200],
//         //             child: Consumer<MyModel>( //                    <--- Consumer
//         //               builder: (context, myModel, child) {
//         //                 return Text(providerdat.someValue.toString());
//         //               },
//         //             ),
//         //           ),
//         //
//         //
//         //
//         //         ],
//         //       ),
//         //       Container(
//         //         child: InkWell(
//         //           onTap: (){
//         //             Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage()),);
//         //           },
//         //           child: Text("next Pages1"),
//         //         ),
//         //       )
//         //     ],
//         //   ),
//         //
//         // ),
//       );
//   }
// }
//
// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//   @override
//   Widget build(BuildContext context) {
//     final providerdat=Provider.of<MyModel>(context);
//     return Scaffold(
//       appBar: AppBar(title: Text('My App')),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//
//                 Container(
//                     padding: const EdgeInsets.all(20),
//                     color: Colors.green[200],
//                     child:  RaisedButton(
//                       child: Text('Do something'),
//                       onPressed: (){
//                         providerdat.doSomething();
//                       },
//                     )
//                 ),
//
//                 Container(
//                   padding: const EdgeInsets.all(35),
//                   color: Colors.blue[200],
//                   child: Consumer<MyModel>( //                    <--- Consumer
//                     builder: (context, myModel, child) {
//                       return Text(providerdat.someValue.toString());
//                     },
//                   ),
//                 ),
//
//               ],
//             ),
//             Container(
//               child: InkWell(
//                 onTap: (){
//                   Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage()),);
//                 },
//                 child: Text("next Pages1"),
//               ),
//             )
//           ],
//         ),
//       ),
//
//     );
//   }
// }
//





//
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
//
// void main(){
//   runApp(VideoDemo());
// }
//
//
// class App extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Title',
//       home: VideoDemo(),
//     );
//   }
// }
//
// class VideoDemo extends StatefulWidget {
//   VideoDemo() : super();
//
//   final String title = "Video Demo";
//
//   @override
//   VideoDemoState createState() => VideoDemoState();
// }
//
// class VideoDemoState extends State<VideoDemo> {
//   //
//   VideoPlayerController _controller;
//   Future<void> _initializeVideoPlayerFuture;
//
//   @override
//   void initState() {
//     _controller = VideoPlayerController.network(
//         "http://ftp5.circleftp.net/FILE/Animation%20Movies/2007/Ratatouille.2007.1080p.BluRay.H264.AAC-RARBG/Ratatouille.2007.1080p.BluRay.H264.AAC-RARBG.mp4");
//     //_controller = VideoPlayerController.asset("videos/sample_video.mp4");
//     _initializeVideoPlayerFuture = _controller.initialize();
//     _controller.setLooping(true);
//     _controller.setVolume(1.0);
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Video Demo"),
//         ),
//         body: FutureBuilder(
//           future: _initializeVideoPlayerFuture,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.done) {
//               return Center(
//                 child: AspectRatio(
//                   aspectRatio: _controller.value.aspectRatio,
//                   child: VideoPlayer(_controller),
//                 ),
//               );
//             } else {
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//           },
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             setState(() {
//               if (_controller.value.isPlaying) {
//                 _controller.pause();
//               } else {
//                 _controller.play();
//               }
//             });
//           },
//           child:
//           Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
//         ),
//       ),
//     );
//   }
// }
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart'; //add pacakge to pubspec.yaml
//
// void main() {
//   runApp(
//     MaterialApp(
//       home: _App(),
//     ),
//   );
// }
//
// List<String> videos = [
//   'http://ftp5.circleftp.net/FILE/Animation%20Movies/2007/Ratatouille.2007.1080p.BluRay.H264.AAC-RARBG/Ratatouille.2007.1080p.BluRay.H264.AAC-RARBG.mp4',
//   'https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_640_3MG.mp4',
//   'https://filesamples.com/samples/video/mp4/sample_640x360.mp4'
// ];
//
// class _App extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('ListView of VideoFeed'),
//         ),
//         body: ListView(
//           padding: const EdgeInsets.all(8),
//           children: <Widget>[
//             VideoPlayerRemote(
//               url: videos[0],
//             ),
//             Container(
//               height: MediaQuery.of(context).size.height,
//               color: Colors.red[600],
//               child: const Center(child: Text('Item A')),
//             ),
//             VideoPlayerRemote(
//               url: videos[1],
//             ),
//             Container(
//               height: MediaQuery.of(context).size.height,
//               color: Colors.greenAccent[500],
//               child: const Center(child: Text('Item B')),
//             ),
//             Container(
//               height: MediaQuery.of(context).size.height,
//               color: Colors.purple[100],
//               child: const Center(child: Text('Item C')),
//             ),
//             VideoPlayerRemote(
//               url: videos[2],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// //video code
//
// class VideoPlayerRemote extends StatefulWidget {
//   final String url;
//   VideoPlayerRemote({this.url});
//   @override
//   _VideoPlayerRemoteState createState() => _VideoPlayerRemoteState();
// }
//
// class _VideoPlayerRemoteState extends State<VideoPlayerRemote> {
//   VideoPlayerController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.network(
//       widget.url, //to access its parent class constructor or variable
//     );
//
//     _controller.addListener(() {
//       setState(() {});
//     });
//     _controller.setLooping(true); //loop through video
//     _controller.initialize(); //initialize the VideoPlayer
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose(); //dispose the VideoPlayer
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: <Widget>[
//           Container(padding: const EdgeInsets.only(top: 20.0)),
//           Container(
//             padding: const EdgeInsets.all(20),
//             child: AspectRatio(
//               aspectRatio: _controller.value.aspectRatio,
//               child: Stack(
//                 alignment: Alignment.bottomCenter,
//                 children: <Widget>[
//                   VideoPlayer(_controller),
//                   _PlayPauseOverlay(controller: _controller),
//                   VideoProgressIndicator(_controller, allowScrubbing: true),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class _PlayPauseOverlay extends StatelessWidget {
//   const _PlayPauseOverlay({Key key, this.controller}) : super(key: key);
//
//   final VideoPlayerController controller;
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: <Widget>[
//         AnimatedSwitcher(
//           duration: Duration(milliseconds: 50),
//           reverseDuration: Duration(milliseconds: 200),
//           child: controller.value.isPlaying
//               ? SizedBox.shrink()
//               : Container(
//             color: Colors.black26,
//             child: Center(
//               child: Icon(
//                 Icons.play_arrow,
//                 color: Colors.white,
//                 size: 100.0,
//               ),
//             ),
//           ),
//         ),
//         GestureDetector(
//           onTap: () {
//             controller.play();
//           },
//         ),
//       ],
//     );
//   }
// }


//
// import 'package:flutter/material.dart';
// import 'package:flick_video_player/flick_video_player.dart';
// import 'package:video_player/video_player.dart';
//
//
// void main(){
//   runApp(MaterialApp(home: SamplePlayer()));
// }
//
// class SamplePlayer extends StatefulWidget {
//   SamplePlayer({Key key}) : super(key: key);
//
//   @override
//   _SamplePlayerState createState() => _SamplePlayerState();
// }
//
// class _SamplePlayerState extends State<SamplePlayer> {
//   FlickManager flickManager;
//   @override
//   void initState() {
//     super.initState();
//     flickManager = FlickManager(
//       videoPlayerController:
//       VideoPlayerController.network("http://ftp5.circleftp.net/FILE/Animation%20Movies/2007/Ratatouille.2007.1080p.BluRay.H264.AAC-RARBG/Ratatouille.2007.1080p.BluRay.H264.AAC-RARBG.mp4"),
//     );
//   }
//
//   var name = [
//     "Ratatouille (2007)",
//     "Monsters, Inc. (2001)",
//     "Space Jam (1996)"
//   ];
//   var video_link = [
//     "http://ftp5.circleftp.net/FILE/Animation%20Movies/2007/Ratatouille.2007.1080p.BluRay.H264.AAC-RARBG/Ratatouille.2007.1080p.BluRay.H264.AAC-RARBG.mp4",
//     "http://ftp5.circleftp.net/FILE/Animation%20Movies/2001/Monsters.Inc.2001.PROPER.1080p.BluRay.H264.AAC-RARBG/Monsters.Inc.2001.PROPER.1080p.BluRay.H264.AAC-RARBG.mp4",
//     "http://ftp5.circleftp.net/FILE/Animation%20Movies/2000%20%26%20Before/Space.Jam.1996.1080p.BluRay.H264.AAC-RARBG/Space.Jam.1996.1080p.BluRay.H264.AAC-RARBG.mp4"
//   ];
//   var imaje_link = [
//     "http://circleftp.net/wp-content/uploads/2020/12/MV5BMTMzODU0NTkxMF5BMl5BanBnXkFtZTcwMjQ4MzMzMw@@._V1_.jpg",
//     "http://circleftp.net/wp-content/uploads/2020/12/MV5BMTY1NTI0ODUyOF5BMl5BanBnXkFtZTgwNTEyNjQ0MDE@._V1_.jpg",
//     "http://circleftp.net/wp-content/uploads/2020/12/MV5BMDgyZTI2YmYtZmI4ZC00MzE0LWIxZWYtMWRlZWYxNjliNTJjXkEyXkFqcGdeQXVyNjY5NDU4NzI@._V1_.jpg",
//   ];
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
//
//







//
// import 'dart:convert';
//
// import 'package:video_player/video_player.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// void main() => runApp(BackgroundVideo());
//
// class BackgroundVideo extends StatefulWidget {
//   @override
//   _BackgroundVideoState createState() => _BackgroundVideoState();
// }
//
// class _BackgroundVideoState extends State<BackgroundVideo> {
//   VideoPlayerController _controller;
//   var data;
//
//   Future getvalue()async{
//     var response= await http.get("http://circleftp.net/cnapp/?type=category&term_id=474");
//     setState(() {
//       var decode=json.decode(response.body);
//       data=decode;
//       //print(widget.a);
//       //debugPrint('x=$x');
//
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.network(
//         'http://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4')
//       ..initialize().then((_) {
//         _controller.play();
//         _controller.setLooping(true);
//         // Ensure the first frame is shown after the video is initialized
//         setState(() {});
//       });
//
//     this.getvalue();
//     print(data);
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Stack(
//           children: <Widget>[
//             SizedBox.expand(
//               child: FittedBox(
//                 fit: BoxFit.cover,
//                 child: SizedBox(
//                   width: _controller.value.size?.width ?? 0,
//                   height: _controller.value.size?.height ?? 0,
//                   child: VideoPlayer(_controller),
//                 ),
//               ),
//             ),
//             LoginWidget()
//           ],
//         ),
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//   }
// }
//
// class LoginWidget extends StatelessWidget {
//   const LoginWidget({
//     Key key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: <Widget>[
//         Container(),
//         Container(
//           padding: EdgeInsets.all(16),
//           width: 300,
//           height: 200,
//           color: Colors.grey.withAlpha(200),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: <Widget>[
//               TextField(
//                 decoration: InputDecoration(
//                   hintText: 'Username',
//                 ),
//               ),
//               TextField(
//                 decoration: InputDecoration(
//                   hintText: 'Password',
//                 ),
//               ),
//               RaisedButton(
//                 child: Text('Login'),
//                 onPressed: () {},
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

//
// import 'dart:typed_data';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_vlc_player/flutter_vlc_player.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => new _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(home: MyAppScaffold());
//   }
// }
//
// class MyAppScaffold extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => MyAppScaffoldState();
// }
//
// class MyAppScaffoldState extends State<MyAppScaffold> {
//   String initUrl =
//       "http://samples.mplayerhq.hu/MPEG-4/embedded_subs/1Video_2Audio_2SUBs_timed_text_streams_.mp4";
//
// //  String initUrl = "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4";
// //  String initUrl = "/storage/emulated/0/Download/Test.mp4";
// //  String initUrl = "/sdcard/Download/Test.mp4";
//
//   String changeUrl =
//       "http://distribution.bbb3d.renderfarming.net/video/mp4/bbb_sunflower_1080p_30fps_normal.mp4";
//
//   Uint8List image;
//   VlcPlayerController _videoViewController;
//
//
//   var _scaffoldKey = new GlobalKey<ScaffoldState>();
//   @override
//   void initState() {
//     _videoViewController = new VlcPlayerController(onInit: () {
//       _videoViewController.play();
//     });
//
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       key: _scaffoldKey,
//       appBar: new AppBar(
//         title: const Text('Plugin example app'),
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.camera),
//         onPressed: _createCameraImage,
//       ),
//       body: Builder(builder: (context) {
//         return Container(
//           padding: EdgeInsets.all(10),
//           child: ListView(
//             shrinkWrap: true,
//             children: <Widget>[
//               SizedBox(
//                 height: 250,
//                 child: new VlcPlayer(
//                   aspectRatio: 16 / 9,
//                   url: initUrl,
//                   isLocalMedia: false,
//                   controller: _videoViewController,
//                   // Play with vlc options
//                   options: [
//                     '--quiet',
// //                '-vvv',
//                     '--no-drop-late-frames',
//                     '--no-skip-frames',
//                     '--rtsp-tcp',
//                   ],
//                   hwAcc: HwAcc.DISABLED,
//                   // or {HwAcc.AUTO, HwAcc.DECODING, HwAcc.FULL}
//                   placeholder: Container(
//                     height: 250.0,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[CircularProgressIndicator()],
//                     ),
//                   ),
//                 ),
//               ),
//
//               Divider(height: 1),
//               image == null
//                   ? Container()
//                   : Container(child: Image.memory(image)),
//             ],
//           ),
//         );
//       }),
//     );
//   }
//
//   @override
//   void dispose() {
//     _videoViewController.dispose();
//     super.dispose();
//   }
//
//
//
//   void _getSubtitleTracks() async {
//     if (_videoViewController.playingState.toString() != "PlayingState.PLAYING")
//       return;
//
//     Map<dynamic, dynamic> subtitleTracks =
//     await _videoViewController.getSpuTracks();
//     //
//     if (subtitleTracks != null && subtitleTracks.length > 0) {
//       int selectedSubId = await showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text("Select Subtitle"),
//             content: Container(
//               width: double.maxFinite,
//               height: 250,
//               child: ListView.builder(
//                 itemCount: subtitleTracks.keys.length + 1,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text(
//                       index < subtitleTracks.keys.length
//                           ? subtitleTracks.values.elementAt(index).toString()
//                           : 'Disable',
//                     ),
//                     onTap: () {
//                       Navigator.pop(
//                         context,
//                         index < subtitleTracks.keys.length
//                             ? subtitleTracks.keys.elementAt(index)
//                             : -1,
//                       );
//                     },
//                   );
//                 },
//               ),
//             ),
//           );
//         },
//       );
//       if (selectedSubId != null)
//         await _videoViewController.setSpuTrack(selectedSubId);
//     }
//   }
//
//   void _getAudioTracks() async {
//     if (_videoViewController.playingState.toString() != "PlayingState.PLAYING")
//       return;
//
//     Map<dynamic, dynamic> audioTracks =
//     await _videoViewController.getAudioTracks();
//     //
//     if (audioTracks != null && audioTracks.length > 0) {
//       int selectedAudioTrackId = await showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text("Select Audio"),
//             content: Container(
//               width: double.maxFinite,
//               height: 250,
//               child: ListView.builder(
//                 itemCount: audioTracks.keys.length + 1,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text(
//                       index < audioTracks.keys.length
//                           ? audioTracks.values.elementAt(index).toString()
//                           : 'Disable',
//                     ),
//                     onTap: () {
//                       Navigator.pop(
//                         context,
//                         index < audioTracks.keys.length
//                             ? audioTracks.keys.elementAt(index)
//                             : -1,
//                       );
//                     },
//                   );
//                 },
//               ),
//             ),
//           );
//         },
//       );
//       if (selectedAudioTrackId != null)
//         await _videoViewController.setAudioTrack(selectedAudioTrackId);
//     }
//   }
//
//   void _getCastDevices() async {
//     Map<dynamic, dynamic> castDevices =
//     await _videoViewController.getCastDevices();
//     //
//     if (castDevices != null && castDevices.length > 0) {
//       String selectedCastDeviceName = await showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text("Select Cast Device"),
//             content: Container(
//               width: double.maxFinite,
//               height: 250,
//               child: ListView.builder(
//                 itemCount: castDevices.keys.length + 1,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text(
//                       index < castDevices.keys.length
//                           ? castDevices.values.elementAt(index).toString()
//                           : 'Disconnect',
//                     ),
//                     onTap: () {
//                       Navigator.pop(
//                         context,
//                         index < castDevices.keys.length
//                             ? castDevices.keys.elementAt(index)
//                             : null,
//                       );
//                     },
//                   );
//                 },
//               ),
//             ),
//           );
//         },
//       );
//       await _videoViewController.startCasting(
//         selectedCastDeviceName,
//       );
//     } else {
//       _scaffoldKey.currentState
//           .showSnackBar(SnackBar(content: Text("No Cast Device Found!")));
//     }
//   }
//
//   void _createCameraImage() async {
//     Uint8List file = await _videoViewController.takeSnapshot();
//     setState(() {
//       image = file;
//     });
//   }
// }
//
//
//
//
//



//
//
// import 'package:flutter/material.dart';
//
// void main() => runApp(new MyApp());
//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       title: 'Flutter Demo',
//       theme: new ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: new MyHomePage(title: 'ListView with Search'),
//     );
//   }
// }
//
// class myclass {
//   String word1;
//   String word2;
//
//   myclass(this.word1, this.word2);
// }
//
// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);
//   final String title;
//
//   @override
//   _MyHomePageState createState() => new _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   TextEditingController editingController = TextEditingController();
//
//   final duplicateItems = List<String>.generate(10000, (i) => "Item $i");
//   var items = List<String>();
//
//   List<myclass> words = [
//     myclass("Start", "دەستپێدکت"),
//     myclass("Go", "دچت"),
//     myclass("Drive", "دهاژوت"),
//     myclass("Sleep", "دنڤت"),
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: new AppBar(
//         title: new Text(widget.title),
//       ),
//       body: Container(
//         child: Column(
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextField(
//                 onChanged: (value) {
//                   setState(() {});
//                 },
//                 controller: editingController,
//                 decoration: InputDecoration(
//                     labelText: "Search",
//                     hintText: "Search",
//                     prefixIcon: Icon(Icons.search),
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(25.0)))),
//               ),
//             ),
//             Expanded(
//               child: ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: words.length,
//                   itemBuilder: (context, index) {
//                     if (editingController.text.isEmpty) {
//                       return ListTile(
//                         title:
//                         Text('${words[index].word1} ${words[index].word2}'),
//                       );
//                     } else if (words[index]
//                         .word1
//                         .toLowerCase()
//                         .contains(editingController.text) ||
//                         words[index]
//                             .word2
//                             .toLowerCase()
//                             .contains(editingController.text)) {
//                       return ListTile(
//                         title:
//                         Text('${words[index].word1} ${words[index].word2}'),
//                       );
//                     } else {
//                       return Container();
//                     }
//                   }),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }




//
// import 'package:chewie/chewie.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
//
// void main() {
//   runApp(
//     const ChewieDemo(),
//   );
// }
//
// class ChewieDemo extends StatefulWidget {
//   // ignore: use_key_in_widget_constructors
//   const ChewieDemo({this.title = 'Chewie Demo'});
//
//   final String title;
//
//   @override
//   State<StatefulWidget> createState() {
//     return _ChewieDemoState();
//   }
// }
//
// class _ChewieDemoState extends State<ChewieDemo> {
//   TargetPlatform _platform;
//   VideoPlayerController _videoPlayerController1;
//   VideoPlayerController _videoPlayerController2;
//   ChewieController _chewieController;
//
//   @override
//   void initState() {
//     super.initState();
//     initializePlayer();
//   }
//
//   @override
//   void dispose() {
//     _videoPlayerController1.dispose();
//     _videoPlayerController2.dispose();
//     _chewieController.dispose();
//     super.dispose();
//   }
//
//   Future<void> initializePlayer() async {
//     _videoPlayerController1 = VideoPlayerController.network(
//         'http://index.circleftp.net/FILE/Hindi%20Contents/Hindi%20Movies/2020/Coolie%20No.%201%20%282020%29%20Hindi%20TRUE%20WEB-DL%20-%201080p%20-%20AVC%20-%20UNTOUCHED%20-%20%28DD+5.1%20-%20640Kbps%29%20-%204GB%20-%20ESub/Coolie%20No.%201%20%282020%29%20Hindi%20TRUE%20WEB-DL%20-%201080p%20-%20AVC%20-%20UNTOUCHED%20-%20%28DD+5.1%20-%20640Kbps%29%20-%204GB%20-%20ESub.mkv');
//     await _videoPlayerController1.initialize();
//     _videoPlayerController2 = VideoPlayerController.network(
//         'http://index.circleftp.net/FILE/Hindi%20Contents/Hindi%20Movies/2020/Coolie%20No.%201%20%282020%29%20Hindi%20TRUE%20WEB-DL%20-%201080p%20-%20AVC%20-%20UNTOUCHED%20-%20%28DD+5.1%20-%20640Kbps%29%20-%204GB%20-%20ESub/Coolie%20No.%201%20%282020%29%20Hindi%20TRUE%20WEB-DL%20-%201080p%20-%20AVC%20-%20UNTOUCHED%20-%20%28DD+5.1%20-%20640Kbps%29%20-%204GB%20-%20ESub.mkv');
//     await _videoPlayerController2.initialize();
//     _chewieController = ChewieController(
//       videoPlayerController: _videoPlayerController1,
//       autoPlay: true,
//       looping: true,
//
//     );
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: widget.title,
//       theme: ThemeData.light().copyWith(
//         platform: _platform ?? Theme.of(context).platform,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text(widget.title),
//         ),
//         body: Column(
//           children: <Widget>[
//             Expanded(
//               child: Center(
//                 child: _chewieController != null &&
//                     _chewieController
//                         .videoPlayerController.value.initialized
//                     ? Chewie(
//                   controller: _chewieController,
//                 )
//                     : Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: const [
//                     CircularProgressIndicator(),
//                     SizedBox(height: 20),
//                     Text('Loading'),
//                   ],
//                 ),
//               ),
//             ),
//             FlatButton(
//               onPressed: () {
//                 _chewieController.enterFullScreen();
//               },
//               child: const Text('Fullscreen'),
//             ),
//             Row(
//               children: <Widget>[
//                 Expanded(
//                   child: FlatButton(
//                     onPressed: () {
//                       setState(() {
//                         _chewieController.dispose();
//                         _videoPlayerController1.pause();
//                         _videoPlayerController1.seekTo(const Duration());
//                         _chewieController = ChewieController(
//                           videoPlayerController: _videoPlayerController1,
//                           autoPlay: true,
//                           looping: true,
//                         );
//                       });
//                     },
//                     child: const Padding(
//                       padding: EdgeInsets.symmetric(vertical: 16.0),
//                       child: Text("Landscape Video"),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: FlatButton(
//                     onPressed: () {
//                       setState(() {
//                         _chewieController.dispose();
//                         _videoPlayerController2.pause();
//                         _videoPlayerController2.seekTo(const Duration());
//                         _chewieController = ChewieController(
//                           videoPlayerController: _videoPlayerController2,
//                           autoPlay: true,
//                           looping: true,
//                         );
//                       });
//                     },
//                     child: const Padding(
//                       padding: EdgeInsets.symmetric(vertical: 16.0),
//                       child: Text("Portrait Video"),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//             Row(
//               children: <Widget>[
//                 Expanded(
//                   child: FlatButton(
//                     onPressed: () {
//                       setState(() {
//                         _platform = TargetPlatform.android;
//                       });
//                     },
//                     child: const Padding(
//                       padding: EdgeInsets.symmetric(vertical: 16.0),
//                       child: Text("Android controls"),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: FlatButton(
//                     onPressed: () {
//                       setState(() {
//                         _platform = TargetPlatform.iOS;
//                       });
//                     },
//                     child: const Padding(
//                       padding: EdgeInsets.symmetric(vertical: 16.0),
//                       child: Text("iOS controls"),
//                     ),
//                   ),
//                 )
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
//
//


//
//
// import 'package:flutter/material.dart';
//
// void main() => runApp(new MyApp());
//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//         title: 'Flutter Demo',
//         theme: new ThemeData(
//         primarySwatch: Colors.blue,
//     ),
//     home: new MyHomePage(title: 'ListView with Search'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);
//   final String title;
//
//   @override
//   _MyHomePageState createState() => new _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   TextEditingController editingController = TextEditingController();
//
//   final duplicateItems = List<String>.generate(10000, (i) => "Item $i");
//   var items = List<String>();
//
//   @override
//   void initState() {
//     items.addAll(duplicateItems);
//     super.initState();
//   }
//
//   void filterSearchResults(String query) {
//     List<String> dummySearchList = List<String>();
//     dummySearchList.addAll(duplicateItems);
//     if(query.isNotEmpty) {
//       List<String> dummyListData = List<String>();
//       dummySearchList.forEach((item) {
//         if(item.contains(query)) {
//           dummyListData.add(item);
//         }
//       });
//       setState(() {
//         items.clear();
//         items.addAll(dummyListData);
//       });
//       return;
//     } else {
//       setState(() {
//         items.clear();
//         items.addAll(duplicateItems);
//       });
//     }
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: new AppBar(
//         title: new Text(widget.title),
//       ),
//       body: Container(
//         child: Column(
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextField(
//                 onChanged: (value) {
//                   filterSearchResults(value);
//                 },
//                 controller: editingController,
//                 decoration: InputDecoration(
//                     labelText: "Search",
//                     hintText: "Search",
//                     prefixIcon: Icon(Icons.search),
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(25.0)))),
//               ),
//             ),
//             Expanded(
//               child: ListView.builder(
//                 shrinkWrap: true,
//                 itemCount: items.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text('${items[index]}'),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
//

import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:circle_network_ftp/playvideo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

import 'Search.dart';

void main() {

  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SamplePlayer()));
}

class SamplePlayer extends StatefulWidget {
  SamplePlayer({Key key}) : super(key: key);

  @override
  _SamplePlayerState createState() => _SamplePlayerState();
}

class _SamplePlayerState extends State<SamplePlayer> {
  var data20191,
      data20173,
      data29605,
      data289,
      data20120,
      data285,
      data20151,
      data20068,
      data20029,
      data19960,
      data474,
      list,
      url,
      result,
      decode_data,
      get_data,
      search_movie;
  var s = "http://circleftp.net/cnapp/?type=category&term_id=";
  TextEditingController _controller;
  var name;

  Future getvalue() async {
    var respons20191 = await http.get(
      "http://circleftp.net/category_by_post/",
    );

    setState(() {
      var decode20191 = json.decode(respons20191.body);

      data20191 = decode20191;

    });

  }

  bool isSearching = false;
  var catagori = [
    "4K Ultra HD Movie Collection",
    "Animation Dubbed Movies",
    "Animation Movie Japanese",
    "Animation Movies",
    "English Foreign Hindi Dubbed Movies",
    "English Movies",
    "Foreign Dubbed Movies",
    "Foreign Language Movies",
    "Hindi Movies",
    "South Indian Dubbed",
    "South Indian Movies",
  ];

  void _filterCountries(value) {
    setState(() {
      search_movie = data20191
          .where((movie) =>
              movie['name'].toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
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
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getvalue();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var h=MediaQuery.of(context).size.height;
    var w=MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Circle FTP"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          Container(
            child: TextField(
              style: TextStyle(color: Colors.white),

              cursorColor: Colors.white,
              onChanged: (text) {
                name = text;
              },
              controller: _controller,
              obscureText: false,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    borderSide: BorderSide(color: Colors.white)
                ),
                border: OutlineInputBorder(),
                //labelText: 'Movie Name',
                hintText: "Search Movie",
                hintStyle: TextStyle(fontSize: w/20,color: Colors.white),
                suffixIcon: InkWell(
                  child: Icon(Icons.search,color: Colors.white,),
                  onTap: () {
                    if (name.length > 0) {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Search(movie_name: name,)));
                    }
                  },
                ),
              ),
            ),
          ),
          Container(
            color: Colors.deepPurpleAccent[50],
            child: ListView.builder(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: data20191 == null ? 0 : catagori.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Column(
                      children: [
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:
                                Text(catagori[index].toString(),style: TextStyle(fontSize: w/20,fontWeight: FontWeight.bold,color: Colors.white),),
                          ),
                        ),
                        Container(
                          height: 200,
                          width: double.infinity,
                          child: ListView.builder(
                              physics: ClampingScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: data20191[index]["movies"] == null ? 0 : data20191[index]["movies"].length,
                              itemBuilder: (BuildContext context, int inde) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Playvideo(name: data20191[index]["movies"][inde]["name"].toString(),
                                                                            url: data20191[index]["movies"][inde]["media"].toString(),
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
                                        imageUrl: data20191[index]["movies"][inde]["banner"].toString(),
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
                                );
                              }),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
