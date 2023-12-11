import 'dart:convert' show utf8;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:simple_video_player_app/repository/video_repository.dart';

import '../data/response/status.dart';

class VideoModelView extends GetxController {
  final _api = VideoRepository();

  final rxRequestStatus = Status.loading.obs;
  final ScrollController scrollController = ScrollController();
  var videoList = List<dynamic>.empty(growable: true).obs;
  int currentPage = 1;
  RxBool isLoading = false.obs;
  RxBool hasMoreData = false.obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setError(String value) => error.value = value;

  @override
  void onInit() {
    loadVideos();
    super.onInit();
  }

  String decodeText(String text) {
    return utf8.decode(text.codeUnits);
  }

  String convertedDate(String date) {
    DateTime now = DateTime.parse(date);
    String formattedDate = DateFormat("MMM d, yyy").format(now);
    return formattedDate;
  }

  // For Pagination
  void paginateVideo(String link) {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (link != "null") {
          currentPage++;
          loadVideos();
        }
      }
    });
  }

  void loadVideos() async {
    try {
      //setRxRequestStatus(Status.loading);
      isLoading(true);
      _api.videoListApi(currentPage).then((value) {
        isLoading(false);
        videoList.addAll(value.results as Iterable);

        if (value.links?.next.toString() != 'null') {
          paginateVideo(value.links!.next.toString());
        } else {
          currentPage;
          videoList.add('No data available');
        }
      }).onError((error, stackTrace) {
        // setRxRequestStatus(Status.error);
      });
    } catch (e) {
      //setRxRequestStatus(Status.error);
    }
  }

  @override
  void onClose() {
    scrollController;
    super.onClose();
  }
}
