import 'package:flutter/material.dart';
import '../../resource/app_colors/app_colors.dart';


class IconsCard extends StatelessWidget {

  final String icons;
  final String title;

  const IconsCard({super.key,  required this.icons,  required this.title});


  @override
  Widget build(BuildContext context) {
    return  Card(
      color: AppColor.bgColor,
      surfaceTintColor: AppColor.bgColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: const BorderSide(
              color: Colors.black12
          )
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 11),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(icons),
            Text(title,style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColor.appGrayColor
            ),)
          ],
        ),
      ),
    );
  }
}
