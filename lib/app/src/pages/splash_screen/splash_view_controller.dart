import 'dart:async';

import 'package:get/get.dart';

import '../../../routes/routes_name.dart';

class SplashViewController extends GetxController {
  final logo = "assets/images/shreelogo.png".obs;

  @override
  void onInit() {
    Timer(const Duration(seconds: 2), () {
      Get.offAllNamed(AppRoutesName.loginScreen);
    });
    super.onInit();
  }
}
