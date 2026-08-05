import 'package:flutter/material.dart';
import 'package:orange_valley_caa/models/video.dart';
import 'package:orange_valley_caa/pages/video_details_page.dart';

class VideoGrid extends StatelessWidget {
  final List<Video> videos;
  VideoGrid({required this.videos});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: [
        for(var video in videos)
        GestureDetector(
          onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>detailspage(video: video))),
          child: _VideoTile(
            imageurl:video.thumbnail,
            title:video.name,
          ),
        )
      ],
    );
  }
}
class _VideoTile extends StatelessWidget {
  _VideoTile({required this.imageurl,required this.title});
  final String imageurl, title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Stack(children:[
        Hero(
          tag: imageurl,
          child: Container(
          width: double.infinity,
          height: double.infinity,
           child: ClipRRect(borderRadius: BorderRadius.circular(50.0),
           child: Image.network(imageurl, fit: BoxFit.contain,)),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            color: Colors.black.withValues(alpha: 0.8),
            child: Text(title, textAlign: TextAlign.center,style: TextStyle(color: Colors.white)),
          ),
          )
      ]),
      );
  }
}

