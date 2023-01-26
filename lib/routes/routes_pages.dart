import 'package:kichiro_team/views/main_screens.dart';

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
      name: RouteNames.mainScreens,
      page: () => const MainScreens(),
      binding: MainScreensBindings(),
    ),
    GetPage(
      name: RouteNames.homeScreens,
      page: () => const HomeScreens(),
    ),
    GetPage(
      name: RouteNames.cartScreens,
      page: () => const CartScreens(),
    ),
    GetPage(
      name: RouteNames.profileScreens,
      page: () => const ProfileScreens(),
    ),
    GetPage(
      name: RouteNames.editProfileScreens,
      page: () => const EditProfileScreens(),
    ),
    GetPage(
      name: RouteNames.detailTeamScreens,
      page: () => const DetailTeamScreens(),
    ),
    GetPage(
      name: RouteNames.addProductScreens,
      page: () => const AddProductScreens(),
    ),
  ];
}
