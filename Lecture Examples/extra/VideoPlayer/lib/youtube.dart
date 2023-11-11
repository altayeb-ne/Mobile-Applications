import 'package:flutter/material.dart';
import 'videoplayer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YouTubeOnly extends StatefulWidget {
  const YouTubeOnly({super.key});
  @override
  State<YouTubeOnly> createState() => _YouTubeOnlyState();
}

class _YouTubeOnlyState extends State<YouTubeOnly> {
  late List<YoutubePlayerController> _youtubeControllers ;

  @override
  Widget showYouTubeVideo(String videoId) {
    YoutubePlayerController _youtubeController = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );

    return  AspectRatio(
      aspectRatio: 16 / 9, // Common aspect ratio for YouTube videos
      child: YoutubePlayer(
        controller: _youtubeController,
        showVideoProgressIndicator: true,
        onReady: () {
        },
      ),
    );

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("YouTube Player Package"),),
        body: Column(children: [

          SizedBox(height: 200,width: double.infinity,),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>VideoApp()));

          }, child: Text("Go To Video Player Package Page")),
          Container(height: 150,child:
          ListView(
            scrollDirection: Axis.horizontal,
            children: [
              showYouTubeVideo('ksppsoxuXXI'),
              SizedBox(width: 20,),
              showYouTubeVideo('fazK3aDwcJ4')

            ],
          )
            ,)
        ])

    );



  }
  @override
  void dispose() {
    super.dispose();
    for (var youtubeController in _youtubeControllers) {
      youtubeController.dispose();
    }
  }
}
