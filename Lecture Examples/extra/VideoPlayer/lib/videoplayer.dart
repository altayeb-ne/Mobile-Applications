import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'youtube.dart';

class VideoApp extends StatefulWidget {
  const VideoApp({super.key});

  @override
  State<VideoApp> createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  int counter = 0;

  List<String> videoUrls = [
    'https://static.videezy.com/system/resources/previews/000/045/000/original/Pigeons-in-Green-Nature-11.mp4',
    'https://static.videezy.com/system/resources/previews/000/046/652/original/MVI_1576.mp4',
    'https://static.videezy.com/system/resources/previews/000/053/154/original/seagulls_3.mp4',

  ];
  late List<VideoPlayerController> _controllers;

  // initState is called exactly once and is the first method called when the widget is created (after the constructor, and after the widget's fields are initialized).

  @override
  void initState() {
    super.initState();
    _controllers = videoUrls.map((url) {
      return VideoPlayerController.network(url)
        ..initialize().then((_) {
          setState(() {});
        });
    }).toList();
  }


  Widget showVideo(int index,String herotag1) {
    var controller = _controllers[index];
    return controller.value.isInitialized
        ? Stack(
      alignment: Alignment.center,
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: VideoPlayer(controller),
        ),
        FloatingActionButton(
          heroTag: herotag1,
           onPressed: () {
            setState(() {
              controller.value.isPlaying ? controller.pause() : controller
                  .play();
            });
          },
          child: Icon(
            controller.value.isPlaying ? Icons.pause : Icons.play_arrow,),
        ),
      ],
    )
        : Container(); // Show an empty container if the video is not initialized
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Video Player Package"),),
        body: Column(children: [
          Container(width: double.infinity, height: 200,),
          ElevatedButton(onPressed: (){
            Navigator.pop(context);

          }, child: Text("Back to YouTube Player Package Page")),
          Container(height: 100, child:
          ListView(
            scrollDirection: Axis.horizontal,
            children: [
              showVideo(0,'vid0'),
              SizedBox(width: 10,),
              showVideo(1,'vid1'),
              SizedBox(width: 10,),
              showVideo(2,'vid2'),
              SizedBox(width: 10,),
            ],
          )
            ,)
        ])
    );
  }

  @override
// dispose method is an override of the State class's dispose method. It is called when this object is removed from the tree permanently.
  void dispose() {
    super.dispose();

    // Loops through all the controllers in the _controllers list.
    for (var controller in _controllers) {
      // For each controller, calls the dispose method on it, which is necessary to release any resources the controller is holding on to.
      controller.dispose();
    }
  }
}
