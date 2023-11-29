

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_video_player_app/resource/app_colors/app_colors.dart';
import 'package:simple_video_player_app/routes/routes.dart';

import 'routes/routes_name.dart';

void main() async {


  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColor.bgColor
      ),
      initialRoute: RoutesName.videoplayView,
      getPages: AppRoutes.appRoutes(),
    );
  }
}
