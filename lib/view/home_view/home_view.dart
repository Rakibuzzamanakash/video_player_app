import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_video_player_app/model_view/video_model_view.dart';
import 'package:simple_video_player_app/resource/app_strings/app_string.dart';
import 'package:simple_video_player_app/routes/routes_name.dart';
import 'package:simple_video_player_app/view/widgets/trending_video_card.dart';

import '../../data/response/status.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final VideoModelView videoModelView = Get.put(VideoModelView());
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                AppString.trendingVideos,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Obx(() {
                switch (videoModelView.rxRequestStatus.value) {
                  case Status.loading:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case Status.error:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case Status.completed:

                    return Expanded(
                      child: ListView.builder(
                          itemCount:
                          videoModelView.videos.value.results!.length,
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          controller: videoModelView.scrollController,
                          itemBuilder: (context, index) {
                            var value =
                            videoModelView.videos.value.results![index];
                            if(videoModelView.videos.value.results!.isNotEmpty){
                              return InkWell(
                                onTap: (){
                                  Get.toNamed(
                                      RoutesName.videoplayView,
                                      arguments: {
                                        "videoLink": value.manifest.toString(),
                                        "index": index,
                                      }
                                  );
                                },
                                child: TrendingVideoCard(
                                    title: videoModelView.decodeText(value.title.toString()),
                                    duration: value.duration.toString(),
                                    views: value.viewers.toString(),
                                    time: videoModelView.convertedDate(value.dateAndTime.toString()),
                                    cardImage: value.thumbnail.toString(),
                                    profileImage: value.channelImage.toString())
                              );
                            }else{
                              const Center(
                                child: Text("No data available"),
                              );
                            }
                            return null;
                          }),
                    );
                }
              }),


            ],
          ),
        ),
      ),
    );
  }
}

