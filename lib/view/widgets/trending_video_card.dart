import 'package:flutter/material.dart';

import '../../resource/app_assets/app_assets.dart';
import '../../resource/app_colors/app_colors.dart';
import '../../resource/dimention/app_dimension.dart';

class TrendingVideoCard extends StatelessWidget {
  final String title;
  final String duration;
  final String views;
  final String time;
  final String cardImage;
  final String profileImage;

  const TrendingVideoCard(
      {super.key,
      required this.title,
      required this.duration,
      required this.views,
      required this.time,
      required this.cardImage,
      required this.profileImage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: double.infinity,
        height: AppDimension(context).height * .335,
        color: AppColor.appWhiteColor,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.maxFinite,
                  height: AppDimension(context).height * .22,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                            cardImage
                          ),
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
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text(
                        style: const TextStyle(
                            color: AppColor.appWhiteColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 12),
                        duration,
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
                      width: AppDimension(context).width * .75,
                      height: AppDimension(context).height * .076,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage(profileImage),
                          ),
                          SizedBox(
                            width: AppDimension(context).width * .6,
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
  }
}
