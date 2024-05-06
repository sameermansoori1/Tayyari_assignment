import 'package:get/get.dart';

import '../controllers/common/drawer_controller.dart';
import '../controllers/leader_board/leader_board_controller.dart';
import '../controllers/profile/profile_controller.dart';
import '../controllers/quiz_paper/quiz_controller.dart';
import '../controllers/quiz_paper/quiz_papers_controller.dart';
import '../screens/auth_and_profile/login_screen.dart';
import '../screens/auth_and_profile/profile_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/leaderboard/leaderboard_screen.dart';
import '../screens/onboarding/app_indroduction_screen.dart';
import '../screens/quiz/answer_check_screen.dart';
import '../screens/quiz/quiz_overview_screen.dart';
import '../screens/quiz/quiz_screen.dart';
import '../screens/quiz/result_screen.dart';
import '../screens/splash/splash.dart';

class AppRoutes {
  static List<GetPage> pages() => [
        GetPage(
          page: () => const SplashScreen(),
          name: SplashScreen.routeName,
        ),
        GetPage(
          page: () => const AppIntroductionScreen(),
          name: AppIntroductionScreen.routeName,
        ),
        GetPage(
            page: () => const HomeScreen(),
            name: HomeScreen.routeName,
            binding: BindingsBuilder(() {
              Get.put(QuizPaperController());
              Get.put(MyDrawerController());
            })),
        GetPage(page: () => const LoginScreen(), name: LoginScreen.routeName),
        GetPage(
            page: () => const ProfileScreen(),
            name: ProfileScreen.routeName,
            binding: BindingsBuilder(() {
              Get.put(QuizPaperController());
              Get.put(ProfileController());
            })),
        GetPage(
            page: () => LeaderBoardScreen(),
            name: LeaderBoardScreen.routeName,
            binding: BindingsBuilder(() {
              Get.put(LeaderBoardController());
            })),
        GetPage(
            page: () => QuizeScreen(),
            name: QuizeScreen.routeName,
            binding: BindingsBuilder(() {
              Get.put<QuizController>( QuizController());
            })),
        GetPage(
            page: () => const AnswersCheckScreen(),
            name: AnswersCheckScreen.routeName),
        GetPage(
            page: () => const QuizOverviewScreen(),
            name: QuizOverviewScreen.routeName),
        GetPage(page: () => const Resultcreen(), name: Resultcreen.routeName),
      ];
}
