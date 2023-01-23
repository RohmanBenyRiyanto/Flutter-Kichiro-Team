import '../utils/importer.dart';

class LoginScreensBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormPasswordController>(
      () => FormPasswordController(),
    );
  }
}

class RegisterScreensBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormPasswordController>(
      () => FormPasswordController(),
    );
  }
}

class MainScreensBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ControllerMainScreens>(
      () => ControllerMainScreens(),
    );
  }
}
