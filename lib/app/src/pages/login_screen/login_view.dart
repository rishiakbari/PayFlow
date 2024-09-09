import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wxyz/app/custom/custom_outline_button.dart';
import 'package:wxyz/app/custom/custom_single_child_scroll_view.dart';
import 'package:wxyz/app/custom/custom_text_form_field.dart';
import 'package:wxyz/app/src/pages/login_screen/login_view_controller.dart';

import '../../../theme/colors.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final loginController = Get.put(LoginViewController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomSingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Login",
                  style: Get.textTheme.titleLarge!.copyWith(
                    color: Colorz.main,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                CustomTextFormField(
                  hintText: "Email",
                  controller: loginController.emailController,
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                CustomTextFormField(
                  hintText: "Password",
                  controller: loginController.passwordController,
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                CustomOutlineButton(
                  text: "Login",
                  isGradient: false,
                  backgroundColor: Colorz.main,
                  textColor: Colorz.textWhite,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
