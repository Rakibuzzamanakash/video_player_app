import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_video_player_app/model_view/video_model_view.dart';
import 'package:simple_video_player_app/resource/app_strings/app_string.dart';
import 'package:simple_video_player_app/routes/routes_name.dart';
import 'package:simple_video_player_app/view/widgets/trending_video_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final VideoModelView videoModelView = Get.put(VideoModelView());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 45,
            ),
            const Text(
              AppString.trendingVideos,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            Expanded(
              child: Obx(() {
                if (videoModelView.videoList.isEmpty &&
                    videoModelView.isLoading.isTrue) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  if (videoModelView.videoList.isNotEmpty) {
                    return ListView.builder(
                      itemCount: videoModelView.videoList.length + 1,
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      controller: videoModelView.scrollController,
                      itemBuilder: (context, index) {
                        if (index < videoModelView.videoList.length) {
                          var value = videoModelView.videoList[index];
                          return videoModelView.videoList[index].toString() ==
                                  'No data available'
                              ? Center(
                                  child: Text(videoModelView.videoList[index]
                                      .toString()),
                                )
                              : InkWell(
                                  onTap: () {
                                    Get.toNamed(RoutesName.videoPlayView,
                                        arguments: {
                                          "videoLink":
                                              value.manifest.toString(),
                                          "index": index,
                                        });
                                  },
                                  child: TrendingVideoCard(
                                    title: videoModelView
                                        .decodeText(value.title.toString()),
                                    duration: value.duration.toString(),
                                    views: value.viewers.toString(),
                                    time: videoModelView.convertedDate(
                                        value.dateAndTime.toString()),
                                    cardImage: value.thumbnail.toString(),
                                    profileImage: value.channelImage.toString(),
                                  ),
                                );
                        } else {
                          if (videoModelView.isLoading.isTrue) {
                            return const Center(
                              child: Padding(
                                padding: EdgeInsets.all(20),
                                child: CircularProgressIndicator(),
                              ),
                            );
                          } else {
                            return Container();
                          }
                        }
                      },
                    );
                  } else {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 20,bottom: 20),
                        child: Text("No data found"),
                      ),
                    );
                  }
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
