import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_video_player_app/view/video_play_view/video_play_widgets.dart';
import '../../model_view/video_model_view.dart';


class VideoPlayView extends StatelessWidget {
  const VideoPlayView({super.key});

  @override
  Widget build(BuildContext context) {
    final VideoModelView videoModelView = Get.put(VideoModelView());
    final index = Get.arguments["index"];
   // var value = videoModelView.videos.value.results![index];
    var value = videoModelView.videoList[index];

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: VideoPlayWidgets(
              url: value.manifest.toString(),
              title: videoModelView.decodeText(value.title.toString()),
              views: value.viewers.toString(),
              time: videoModelView.convertedDate(value.dateAndTime.toString()),
              chanelImage: value.channelImage.toString(),
              chanelName: value.channelName.toString()),
        ),
      ),
    );
  }
}

