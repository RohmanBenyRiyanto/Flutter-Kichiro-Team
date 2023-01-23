import '../utils/importer.dart';

class ControllerMainScreens extends GetxController {
  List<Widget> buildScreens() {
    return [
      const HomeScreens(),
      const CartScreens(),
      const ProfileScreens(),
    ];
  }

  late PersistentTabController controller;

  @override
  void onInit() {
    controller = PersistentTabController(initialIndex: 0);
    super.onInit();
  }

  List<PersistentBottomNavBarItem> navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          'assets/icons/ic_home.svg',
          color: ThemesColor.whiteColor,
        ),
        inactiveIcon: SvgPicture.asset(
          'assets/icons/ic_home.svg',
          color: ThemesColor.subtitleColor,
        ),
        title: ("Home"),
        textStyle: FontStyles.overline.copyWith(
          color: ThemesColor.whiteColor,
        ),
        activeColorSecondary: ThemesColor.whiteColor,
        inactiveColorSecondary: ThemesColor.subtitleColor,
        activeColorPrimary: ThemesColor.primaryColor,
        inactiveColorPrimary: ThemesColor.greyColor,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          'assets/icons/ic_cart.svg',
          color: ThemesColor.whiteColor,
        ),
        inactiveIcon: SvgPicture.asset(
          'assets/icons/ic_cart.svg',
          color: ThemesColor.subtitleColor,
        ),
        title: ("Cart"),
        textStyle: FontStyles.overline.copyWith(
          color: ThemesColor.whiteColor,
        ),
        activeColorSecondary: ThemesColor.whiteColor,
        inactiveColorSecondary: ThemesColor.subtitleColor,
        activeColorPrimary: ThemesColor.primaryColor,
        inactiveColorPrimary: ThemesColor.greyColor,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          'assets/icons/ic_profile.svg',
          color: ThemesColor.whiteColor,
        ),
        inactiveIcon: SvgPicture.asset(
          'assets/icons/ic_profile.svg',
          color: ThemesColor.subtitleColor,
        ),
        title: ("Profile"),
        textStyle: FontStyles.overline.copyWith(
          color: ThemesColor.whiteColor,
        ),
        activeColorSecondary: ThemesColor.whiteColor,
        inactiveColorSecondary: ThemesColor.subtitleColor,
        activeColorPrimary: ThemesColor.primaryColor,
        inactiveColorPrimary: ThemesColor.greyColor,
      ),
    ];
  }
}
