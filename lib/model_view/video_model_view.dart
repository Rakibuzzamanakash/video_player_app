import 'dart:convert' show utf8;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:simple_video_player_app/model/VideoModel.dart';
import 'package:simple_video_player_app/repository/video_repository.dart';

import '../data/response/status.dart';

class VideoModelView extends GetxController{

  final _api = VideoRepository();

  final rxRequestStatus = Status.loading.obs;
  final ScrollController scrollController = ScrollController();
  final videoList = VideoModel().obs;
  final videos = VideoModel().obs;

  RxString error = ''.obs;


  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setVideoList(VideoModel value) => videoList.value = value;
  void setVideos(VideoModel value) => videos.value = value;
  void setError(String value) => error.value = value;


  @override
  void onInit() {

    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        loadVideos();
      }
    });


    loadVideos();
    super.onInit();
  }

String decodeText(String text){
  return utf8.decode(text.codeUnits);
}

String convertedDate(String date){
  DateTime now = DateTime.parse(date);
  String formattedDate = DateFormat("MMM d, yyy").format(now);
  return formattedDate;
}


  int currentPage = 1;
  bool isLoading = false;
  bool hasMoreData = true;

  Future<void> loadVideos() async {
    if (isLoading || !hasMoreData) {
      return;
    }

    try {
      isLoading = true;
        setRxRequestStatus(Status.loading);
       _api.videoListApi(currentPage).then((value){
         setRxRequestStatus(Status.completed);
         setVideoList(value);
         if (videoList.value.results!.isEmpty) {
           hasMoreData = false;
         } else {
          // videos.value = videoList.value;
           setVideos(videoList.value);

           currentPage++;
         }
       }).onError((error, stackTrace) {
         setRxRequestStatus(Status.error);
       });

    } finally {
      isLoading = false;
    }
  }


}