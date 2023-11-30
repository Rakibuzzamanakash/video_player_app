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
        body: SingleChildScrollView(
          child: Padding(
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
                    case Status.LOADING:
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    case Status.ERROR:
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    case Status.COMPLETED:
                      if (videoModelView.videos.value.results!.isEmpty &&
                          videoModelView.isLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (videoModelView.videos.value.results!.isEmpty &&
                          !videoModelView.hasMoreData) {
                        return const Center(child: Text('No data available.'));
                      } else {
                        return ListView.builder(
                            itemCount:
                                videoModelView.videos.value.results!.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            controller: videoModelView.scrollController,
                            itemBuilder: (context, index) {
                              var value =
                                  videoModelView.videos.value.results![index];
                              if (index <
                                  videoModelView.videos.value.results!.length) {
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
                                      profileImage: value.channelImage.toString()),
                                );
                              } else {
                                // Loading indicator when reaching the end
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                            });
                      }
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

