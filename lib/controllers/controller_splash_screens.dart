import '../utils/importer.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(
      const Duration(
        seconds: 3,
      ),
      () {
        Get.offNamed(
          RouteNames.loginScreens,
        );
      },
    );
  }
}
