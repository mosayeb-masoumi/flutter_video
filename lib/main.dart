import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter_video_list_chewie/chewie_list_item.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Video player"),
      ),
      body: ListView(
        children: [
          
          ChewieListItem(
              videoPlayerController: VideoPlayerController.asset(
                "videos/sample.mp4",
                // "assets/sample.mp4",
              ),
              looping: true,
          ),

          ChewieListItem(
            videoPlayerController: VideoPlayerController.network(
              "https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/1080/Big_Buck_Bunny_1080_10s_1MB.mp4",
            ), looping: false,
          ),

          ChewieListItem(
            videoPlayerController: VideoPlayerController.network(
              "https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/1080/error.mp4",
            ),
            looping: true,
          ),
          
        ],
      ),
    );
  }
}
