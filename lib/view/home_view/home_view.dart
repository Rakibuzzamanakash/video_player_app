import 'package:flutter/material.dart';
import 'package:simple_video_player_app/resource/app_assets/app_assets.dart';
import 'package:simple_video_player_app/resource/app_colors/app_colors.dart';
import 'package:simple_video_player_app/resource/app_strings/app_string.dart';
import 'package:simple_video_player_app/resource/dimention/app_dimension.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
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
                ListView.builder(
                    itemCount: 10,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Container(
                          width: double.infinity,
                          height: AppDimension(context).height * .333,
                          color: AppColor.appWhiteColor,
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    width: double.maxFinite,
                                    height: AppDimension(context).height * .22,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                AppAssets.thumbnilImage),
                                            fit: BoxFit.fill)),
                                  ),
                                  Positioned(
                                    bottom: 5,
                                    right: 10,
                                    child: Container(
                                      height: 20,
                                      width: 35,
                                      decoration: BoxDecoration(
                                          color: AppColor.appBlackColor,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: const Center(
                                        child: Text(
                                          "3:40",
                                          style: TextStyle(
                                              color: AppColor.appWhiteColor,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: SizedBox(
                                  width: double.maxFinite,
                                  height: AppDimension(context).height * .076,
                                  // color: Colors.teal,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width:
                                            AppDimension(context).width * .75,
                                        height:
                                            AppDimension(context).height * .076,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const CircleAvatar(
                                              radius: 20,
                                              backgroundImage: AssetImage(
                                                  AppAssets.chanelImage),
                                            ),
                                            SizedBox(
                                              width:
                                                  AppDimension(context).width *
                                                      .6,
                                              height: AppDimension(context).height *.09,
                                              child: const Column(
                                                children: [
                                                  Text(
                                                    AppString.videoTitle,
                                                    overflow: TextOverflow.ellipsis,
                                                    textAlign: TextAlign.start,
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                    fontSize: 14,

                                                    ),
                                                  ),
                                                  Text(
                                                    AppString.videoViewsTime,
                                                    overflow: TextOverflow.ellipsis,
                                                    textAlign: TextAlign.center,
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                    color: AppColor.appGrayColor,
                                                    fontSize: 13,

                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Image.asset(AppAssets.moreIcon),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
