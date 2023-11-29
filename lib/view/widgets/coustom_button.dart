import 'package:flutter/material.dart';

import '../../resource/app_colors/app_colors.dart';
import '../../resource/dimention/app_dimension.dart';

class CoustomBUtton extends StatelessWidget {
  final IconData icons;
  final String title;
  final Function onAction;
  const CoustomBUtton({super.key, required this.icons, required this.title, required this.onAction});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onAction(),
      child: Container(
        width: AppDimension(context).width* .29,
        height: AppDimension(context).height* .045,
        decoration: BoxDecoration(
            color: AppColor.appBlueColor,
            borderRadius: BorderRadius.circular(5)
        ),
        child:  Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icons ,size: 14,color: Colors.white,),
            const SizedBox(width: 10,),
            Text(title,style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.white
            ),),
          ],
        ),
      ),
    );
  }
}
