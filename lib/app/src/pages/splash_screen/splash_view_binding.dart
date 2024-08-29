import 'package:get/get.dart';
import 'package:wxyz/app/src/pages/splash_screen/splash_view_controller.dart';

class SplashViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashViewController>(
      () => SplashViewController(),
    );
  }
}
