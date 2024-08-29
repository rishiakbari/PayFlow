import 'package:get/get.dart';
import 'package:wxyz/app/src/pages/login_screen/login_view_controller.dart';

class LoginViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginViewController>(
      () => LoginViewController(),
    );
  }
}
