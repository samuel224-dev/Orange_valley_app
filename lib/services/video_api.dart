import 'package:http/http.dart' as http;
import 'package:orange_valley_caa/models/video.dart';

Future<List<Video>> getVideofromApi({videosort filter=videosort.id})async {
  final url=Uri.parse('https://orangevalleycaa.org/api/videos/order/${filter.filtername()}');
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var json=response.body;
    return videoFromJson(json);
  } else {
    return [];
  }

} 


