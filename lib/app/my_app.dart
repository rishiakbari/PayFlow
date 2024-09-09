import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes/app_routes.dart';
import 'routes/routes_name.dart';
import 'src/pages/splash_screen/splash_view.dart';
import 'theme/theme.dart';

class PayFlow extends StatelessWidget {
  const PayFlow({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: buildLightThemeData(context),
      darkTheme: buildDarkThemeData(context),
      themeMode: ThemeMode.system,
      initialRoute: AppRoutesName.splashScreen,
      getPages: AppRoutes.appRoutes(), 
      home: SplashView(),
    );
  }
}
