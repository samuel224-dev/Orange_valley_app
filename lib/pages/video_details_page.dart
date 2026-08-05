import 'package:flutter/material.dart';
import 'package:orange_valley_caa/models/video.dart';
import 'package:orange_valley_caa/utils/constant.dart';
import 'package:orange_valley_caa/pages/videoplayerscreen_page.dart';

class detailspage extends StatelessWidget {
  detailspage({required this.video});
  final Video video;

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(video.name)),
    body: Container(
      color: backgroundcolor,
      width: double.infinity,
      child: _videodetail(video: video),
    ),
    );
  }
}
class _videodetail extends StatelessWidget {
  _videodetail({required this.video});
  final Video video;
  Widget getdescription()=> Text(
    video.description, style:
     TextStyle(color:
      Colors.white,
      fontFamily: 'castoropolice',
      fontStyle: FontStyle.italic,
       ),
       );

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _DetailPoster(
          posteurl: video.thumbnail,
          videourl: video.videoUrl,
        ),
        SizedBox(height: 20.0),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: getdescription(),
           )
      ],
    );
  
  }
}
class _DetailPoster extends StatelessWidget {
  _DetailPoster({required this.posteurl, required this.videourl});
  final String posteurl;
  final String videourl;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: posteurl,
      child: GestureDetector(
        onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>VideoPlayerScreen(url: videourl))),
      child: Stack(
        children:[
          Container(
        width: double.infinity,
        height: 200.0,
        child: Image.network(posteurl, fit: BoxFit.fitWidth,)
      ),
      Center(child: Icon(Icons.play_circle_outline, color: Colors.white, size: 130.0),)
      ]
      )
    ),
    );
  }
}