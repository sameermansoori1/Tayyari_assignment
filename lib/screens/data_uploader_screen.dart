import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/quiz_paper/papers_data_uploader.dart';
import '../firebase/loading_status.dart';

// ignore: must_be_immutable
class DataUploaderScreen extends StatelessWidget {
  DataUploaderScreen({Key? key}) : super(key: key);
  PapersDataUploader controller = Get.put(PapersDataUploader());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Obx(() => Text(
              controller.loadingStatus.value == LoadingStatus.completed
                  ? "Uploading Complete"
                  : "Uploading...."))),
    );
  }
}
