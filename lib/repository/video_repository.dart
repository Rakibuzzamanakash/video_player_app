import 'package:simple_video_player_app/data/network/network_api_services.dart';
import 'package:simple_video_player_app/resource/app_url/app_url.dart';

import '../model/VideoModel.dart';

class VideoRepository{
  
  final _apiService = NetworkApiServices();
  
  Future<VideoModel> videoListApi(int page) async{
    dynamic response = await _apiService.getApi(AppUrl.videoUrl+page.toString());
    return VideoModel.fromJson(response);
  }
  
}