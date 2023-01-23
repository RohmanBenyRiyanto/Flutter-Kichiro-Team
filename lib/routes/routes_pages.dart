import '../utils/importer.dart';

class RoutePages {
  static final pages = [
    GetPage(
      name: RouteNames.splashScreens,
      page: () => const SplashScreens(),
    ),
    GetPage(
      name: RouteNames.loginScreens,
      page: () => const LoginScreens(),
      binding: LoginScreensBinding(),
    ),
    GetPage(
      name: RouteNames.registerScreens,
      page: () => const RegisterScreens(),
      binding: RegisterScreensBindings(),
    ),
    GetPage(
      name: RouteNames.homeScreens,
      page: () => const HomeScreens(),
    ),
  ];
}
