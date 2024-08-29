import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wxyz/app/src/pages/splash_screen/splash_view_controller.dart';

class SplashView extends StatelessWidget {
  SplashView({super.key});
  final splashController = Get.put(SplashViewController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    splashController.logo.value,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
