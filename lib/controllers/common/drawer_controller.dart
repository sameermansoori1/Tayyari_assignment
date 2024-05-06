import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../auth_controller.dart';

class MyDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();
  Rxn<User?> user = Rxn();

  void toggleDrawer() {
    zoomDrawerController.toggle?.call();
    update();
  }

  void signOut() {
    Get.find<AuthController>().signOut();
  }

  void signIn() {
    Get.find<AuthController>().navigateToLogin();
  }

  void github() {
    _launch('https://github.com/sameermansoori1');
  }

  void email() {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'sameernk220@gmail.com',
    );
    _launch(emailLaunchUri.toString());
  }

  void linkedIn() {
    _launch('https://www.linkedin.com/in/sameer-mansoori-b8315a203/');
  }

  @override
  void onReady() {
    user.value = Get.find<AuthController>().getUser();
    super.onReady();
  }

  Future<void> _launch(String url) async {
    if (!await launch(
      url,
    )) {
      throw 'Could not launch $url';
    }
  }
}
