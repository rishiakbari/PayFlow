import 'package:get/get.dart';

import '../src/pages/login_screen/login_view.dart';
import '../src/pages/login_screen/login_view_binding.dart';
import '../src/pages/splash_screen/splash_view.dart';
import '../src/pages/splash_screen/splash_view_binding.dart';
import 'routes_name.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: AppRoutesName.splashScreen,
          page: () => SplashView(),
          binding: SplashViewBinding(),
          transition: Transition.rightToLeftWithFade,
          transitionDuration: const Duration(milliseconds: 500),
        ),
        GetPage(
          name: AppRoutesName.loginScreen,
          page: () => LoginView(),
          binding: LoginViewBinding(),
          transition: Transition.rightToLeftWithFade,
          transitionDuration: const Duration(milliseconds: 500),
        ),
      ];
}
