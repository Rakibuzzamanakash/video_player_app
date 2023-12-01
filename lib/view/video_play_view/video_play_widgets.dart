import 'package:flutter/material.dart';
import 'package:lecle_yoyo_player/lecle_yoyo_player.dart';
import '../../resource/app_assets/app_assets.dart';
import '../../resource/app_colors/app_colors.dart';
import '../../resource/app_strings/app_string.dart';
import '../../resource/dimention/app_dimension.dart';
import '../widgets/coustom_button.dart';
import '../widgets/icon_card.dart';

class VideoPlayWidgets extends StatelessWidget {
  final String url;
  final String title;
  final String views;
  final String time;
  final String chanelImage;
  final String chanelName;

  const VideoPlayWidgets(
      {super.key,
      required this.url,
      required this.title,
      required this.views,
      required this.time,
      required this.chanelImage,
      required this.chanelName});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        YoYoPlayer(
          aspectRatio: 16 / 9,
          url: url,
          videoStyle: const VideoStyle(
            qualityStyle: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
            forwardAndBackwardBtSize: 30.0,
            playButtonIconSize: 40.0,
            playIcon: Icon(
              Icons.play_circle_outline_outlined,
              size: 40.0,
              color: Colors.white,
            ),
            pauseIcon: Icon(
              Icons.pause_circle_outline_outlined,
              size: 40.0,
              color: Colors.white,
            ),
            //videoQualityPadding: EdgeInsets.all(5.0),
          ),
          videoLoadingStyle: const VideoLoadingStyle(
            loading: Center(
              child: CircularProgressIndicator(
                color: AppColor.appGrayColor,
              ),
            ),
          ),
          // allowCacheFile: true,
          // onCacheFileCompleted: (files) {
          //   print('Cached file length ::: ${files?.length}');
          //
          //   if (files != null && files.isNotEmpty) {
          //     for (var file in files) {
          //       print('File path ::: ${file.path}');
          //     }
          //   }
          // },
          // onCacheFileFailed: (error) {
          //   print('Cache file error ::: $error');
          // },
          // onFullScreen: (value) {
          //   // setState(() {
          //   //   if (fullscreen != value) {
          //   //     fullscreen = value;
          //   //   }
          //   // });
          // }
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                width: AppDimension(context).width * .9,
                height: AppDimension(context).height * .09,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      maxLines: 2,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "$views views  .   "
                      "$time",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        color: AppColor.appGrayColor,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: double.maxFinite,
                height: AppDimension(context).height * .08,
                // color: Colors.teal,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconsCard(
                        icons: AppAssets.favouritIcon,
                        title: AppString.mashAllah),
                    IconsCard(icons: AppAssets.likeIcon, title: AppString.like),
                    IconsCard(
                        icons: AppAssets.shareIcon, title: AppString.share),
                    IconsCard(
                        icons: AppAssets.flagIcon, title: AppString.report),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: double.maxFinite,
                height: AppDimension(context).height * .06,
                //color: Colors.teal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(chanelImage),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              chanelName,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: AppColor.appBlackColor),
                            ),
                            const Text(
                              AppString.subscribers,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 11,
                                  color: AppColor.appGrayColor),
                            )
                          ],
                        ),
                      ],
                    ),
                    CoustomBUtton(
                        icons: Icons.add,
                        title: AppString.subscribe,
                        onAction: () {})
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
        const Divider(
          height: .2,
          color: AppColor.appLightGrayColor,
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              SizedBox(
                height: AppDimension(context).height * .03,
                width: double.infinity,
                // color: Colors.green,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      AppString.comments,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColor.appGrayColor),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AppAssets.arrowUpIcon),
                        const SizedBox(
                          height: 2,
                        ),
                        Image.asset(AppAssets.arrowDownIcon),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                height: AppDimension(context).height * .055,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColor.appWhiteColor,
                    borderRadius: BorderRadius.circular(5),
                    border:
                        Border.all(width: .5, color: AppColor.appGrayColor)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        AppString.addComment,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColor.appGrayColor),
                      ),
                      Image.asset(AppAssets.sendIcon)
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                //height: AppDimension(context).height *.072,
                width: double.infinity,
                //color: Colors.green,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 16,
                      backgroundImage: AssetImage(AppAssets.profileImage),
                    ),
                    SizedBox(
                      width: AppDimension(context).width * .85,
                      //color: Colors.yellow,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                AppString.fahmidaKhanom,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.appGrayColor),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                AppString.daysAgo,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 8,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.appGrayColor),
                              ),
                            ],
                          ),
                          Text(
                            AppString.comment,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppColor.appDarkGrayColor),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
        const Divider(
          height: .2,
          color: AppColor.appLightGrayColor,
        ),
      ],
    );
  }
}
