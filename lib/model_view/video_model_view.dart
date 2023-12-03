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
   final videos = VideoModel().obs;
  //final videos = <VideoModel>[].obs;
  RxString error = ''.obs;


  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setVideos(VideoModel value) => videos.value = value; // Append new videos to the existing list
  void setError(String value) => error.value = value;


  @override
  void onInit() {



    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        if(videos.value.links!.next.toString() != "null"){
          currentPage++;
          loadVideos();
        }
      }else if(scrollController.position.pixels == scrollController.position.minScrollExtent){
        if (currentPage > 1) {
          currentPage--;
          loadVideos();
        }
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

    try {
      setRxRequestStatus(Status.loading);
      _api.videoListApi(currentPage).then((value){
        setRxRequestStatus(Status.completed);
        setVideos(value);
        // print("=======this is value =======");
        // print(value.results!.length);
        // print("=======this is value =======");

      }).onError((error, stackTrace) {
        setRxRequestStatus(Status.error);
      });

    }catch(e){
      setRxRequestStatus(Status.error);
    }
  }


}