import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      home: SplashView(),
    );
  }
}
