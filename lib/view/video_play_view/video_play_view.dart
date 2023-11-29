import 'package:flutter/material.dart';
import 'package:simple_video_player_app/view/widgets/coustom_button.dart';
import 'package:simple_video_player_app/view/widgets/icon_card.dart';

import '../../resource/app_assets/app_assets.dart';
import '../../resource/app_colors/app_colors.dart';
import '../../resource/app_strings/app_string.dart';
import '../../resource/dimention/app_dimension.dart';

class VideoPlayView extends StatelessWidget {
  const VideoPlayView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.maxFinite,
                height: AppDimension(context).height * .24,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            AppAssets.thumbnilImage),
                        fit: BoxFit.fill)),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
          
                  children: [
                    SizedBox(
                      width:
                      AppDimension(context).width *
                          .9,
                      height: AppDimension(context).height *.09,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                          SizedBox(height: 10,),
                          Text(
                            AppString.videoViewsTime,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
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
                    const SizedBox(height: 15,),
                    SizedBox(
                      width:
                      double.maxFinite,
                      height: AppDimension(context).height *.08,
                     // color: Colors.teal,
                      child:  const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconsCard(icons: AppAssets.favouritIcon, title: AppString.mashAllah),
                          IconsCard(icons: AppAssets.likeIcon, title: AppString.like),
                          IconsCard(icons: AppAssets.shareIcon, title: AppString.share),
                          IconsCard(icons: AppAssets.flagIcon, title: AppString.report),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15,),
                    SizedBox(
                      width:
                      double.maxFinite,
                      height: AppDimension(context).height *.06,
                       //color: Colors.teal,
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           const Row(
                             children: [
                               CircleAvatar(
                                 radius: 20,
                                 backgroundImage: AssetImage(AppAssets.profileIcon),
                               ),
                               SizedBox(width: 10,),
                               Column(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text(AppString.megaBanglaTv,style: TextStyle(
                                     fontWeight: FontWeight.w500,
                                     fontSize: 14,
                                     color: AppColor.appBlackColor
                                   ),),
                                   Text(AppString.subscribers,style: TextStyle(
                                     fontWeight: FontWeight.w400,
                                     fontSize: 11,
                                     color: AppColor.appGrayColor
                                   ),)
                                 ],
                               ),
                             ],
                           ),
                          CoustomBUtton(icons: Icons.add, title: AppString.subscribe, onAction: (){})
                        ],
                      ),
                    ),
                    const SizedBox(height: 5,),
                  ],
                ),
              ),
              const Divider(height: .2,color: AppColor.appLightGrayColor,),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: AppDimension(context).height *.03,
                      width: double.infinity,
                      // color: Colors.green,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(AppString.comments,style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColor.appGrayColor
                          ),),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(AppAssets.arrowUpIcon),
                              const SizedBox(height: 2,),
                              Image.asset(AppAssets.arrowDownIcon),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Container(
                      height: AppDimension(context).height *.055,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColor.appWhiteColor,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          width: .5,
                          color: AppColor.appGrayColor
                        )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(AppString.addComment,style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: AppColor.appGrayColor
                            ),),
                            Image.asset(AppAssets.sendIcon)
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 15,),
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
                            width: AppDimension(context).width* .85,
                            //color: Colors.yellow,
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(AppString.fahmidaKhanom,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: AppColor.appGrayColor
                                    ),),
                                    SizedBox(width: 10,),
                                    Text(AppString.daysAgo,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 8,
                                        fontWeight: FontWeight.w400,
                                        color: AppColor.appGrayColor
                                    ),),
                                  ],
                                ),
                                Text(AppString.comment,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.appDarkGrayColor
                                  ),),
                              ],
                            ),
                          ),
          
                        ],
                      ),
                    ),
                    const SizedBox(height: 15,),
                  ],
                ),
              ),
              const Divider(height: .2,color: AppColor.appLightGrayColor,),
            ],
          ),
        ),
      ),
    );
  }
}
