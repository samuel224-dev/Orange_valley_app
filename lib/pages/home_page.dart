import 'package:flutter/material.dart';
import 'package:orange_valley_caa/models/video.dart';
import 'package:orange_valley_caa/services/video_api.dart';
import 'package:orange_valley_caa/utils/constant.dart';
import 'package:orange_valley_caa/widgets/video_grid.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _selectedfilter=videosort.id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("orange valley", style: TextStyle(color: Colors.white)), backgroundColor:
     backgroundcolor,
     actions:[
      PopupMenuButton(
        onSelected: _onchangefilter,
     icon: Icon(Icons.sort, color: Colors.white),
     offset: Offset(0, 40),
     itemBuilder: (context)=>[
     PopupMenuItem(value: videosort.id,child: Text("par defaut")),
     PopupMenuItem(value: videosort.name,child: Text("par nom")),
     PopupMenuItem(value: videosort.duration,child: Text("par durée")),
     ],  
     ),
     ]
     ),
    body: Container(
      color: backgroundcolor,
      child: FutureBuilder(
        future: getVideofromApi(filter: _selectedfilter),
         builder: (context,snapshot){
          if (snapshot.connectionState==ConnectionState.waiting)
            return Center(child: CircularProgressIndicator());
          else if (snapshot.hasError)
             return Center(child: Text(snapshot.hasError.toString()),);
          else return VideoGrid(videos: snapshot.data as List<Video>);
         }),
    ),
    );
  }
  
  void _onchangefilter(videosort choice) {
    if (choice != _selectedfilter) {
      setState(() {
        _selectedfilter = choice;
      });
    }

  }
}