import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ChewieListItem extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final bool looping;

  const ChewieListItem({
    required this.videoPlayerController,
    required this.looping,
    Key? key
  }): super(key: key);

  @override
  _ChewieListItemState createState() => _ChewieListItemState();
}

class _ChewieListItemState extends State<ChewieListItem> {
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();

    _chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController,
      aspectRatio: 16 / 9,
      // prepare video to be played and display the first frame
      autoInitialize: true,
      looping: widget.looping,

      // show error text while error loading
      errorBuilder: (context, errorMessage) {
        return Container(
          margin: EdgeInsets.all(20),
          child: Center(
            child: Text(
              // errorMessage,
              "error",
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Chewie(
          controller: _chewieController,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    // important to dispose of all the usedresources
    widget.videoPlayerController.dispose();
    _chewieController.dispose();
  }
}
