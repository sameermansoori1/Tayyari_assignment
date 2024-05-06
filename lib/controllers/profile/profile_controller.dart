import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';


import '../../firebase/references.dart';
import '../../models/quiz_paper_model.dart';
import '../../models/recent_papers.dart';
import '../../services/firebase/firebasestorage_service.dart';
import '../../utils/logger.dart';
import '../auth_controller.dart';

class ProfileController extends GetxController {
  @override
  void onReady() {
    getMyRecentTests();
    super.onReady();
  }

  final allRecentTest = <RecentTest>[].obs;

  getMyRecentTests() async {
    try {
      User? user = Get.find<AuthController>().getUser();
      if (user == null) return;
      QuerySnapshot<Map<String, dynamic>> data =
          await recentQuizes(userId: user.email!).get();
      final tests =
          data.docs.map((paper) => RecentTest.fromSnapshot(paper)).toList();

      for (RecentTest test in tests) {
        DocumentSnapshot<Map<String, dynamic>> quizPaperSnaphot =
            await quizePaperFR.doc(test.paperId).get();
        final quizPaper = QuizPaperModel.fromSnapshot(quizPaperSnaphot);

        final url =  await Get.find<FireBaseStorageService>().getImage(quizPaper.title);
        test.papername = quizPaper.title;
        test.paperimage = url;
      }

      allRecentTest.assignAll(tests);
    } catch (e) {
      AppLogger.e(e);
    }
  }
}
