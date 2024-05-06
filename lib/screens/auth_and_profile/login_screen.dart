import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../configs/themes/app_colors.dart';
import '../../configs/themes/ui_parameters.dart';
import '../../controllers/auth_controller.dart';
import '../../widgets/common/custom_app_bar.dart';
import '../../widgets/common/main_button.dart';

class LoginScreen extends GetView<AuthController> {
  const LoginScreen({Key? key}) : super(key: key);

  static const String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      extendBodyBehindAppBar: true,
      appBar:  CustomAppBar(leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.black,size: 27,), // Change color to white
    onPressed: () {
    Navigator.of(context).pop();
  },)),
      body: Container(
          constraints: const BoxConstraints(maxWidth: kTabletChangePoint),
          padding: const EdgeInsets.symmetric(horizontal: 30),
          alignment: Alignment.center,
          decoration: BoxDecoration(color:Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Image.asset('assets/images/Tayyari.jpg'),
               Padding(
                padding: EdgeInsets.symmetric(vertical: 60),
                child: Text(
                  'Please Login with your existing Gmail id no need to create new account here..',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color:Colors.black.withOpacity(0.8), fontWeight: FontWeight.bold),
                ),
              ),
              MainButton(
                onTap: () {
                  controller.siginInWithGoogle();
                 },
                color: Colors.orangeAccent.shade100,
                child: Stack(
                  children: [
                    Positioned(
                        top: 0,
                        bottom: 0,
                        left: 0,
                        child: SvgPicture.asset(
                          'assets/icons/google.svg',
                        )),
                    Center(
                      child: Text(
                        'Sign in  with google',
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.8),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
