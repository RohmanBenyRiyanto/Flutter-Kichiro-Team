import '../utils/importer.dart';

class MainScreens extends StatelessWidget {
  const MainScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllerMainScreens>(
      init: ControllerMainScreens(),
      builder: (mainScreensController) {
        return PersistentTabView(
          context,
          controller: mainScreensController.controller,
          screens: mainScreensController.buildScreens(),
          items: mainScreensController.navBarsItems(),
          confineInSafeArea: true,
          backgroundColor: ThemesColor.whiteColor,
          handleAndroidBackButtonPress: true,
          resizeToAvoidBottomInset: true,
          stateManagement: true,
          hideNavigationBarWhenKeyboardShows: true,
          popAllScreensOnTapOfSelectedTab: true,
          popActionScreens: PopActionScreensType.all,
          decoration: NavBarDecoration(
            boxShadow: [
              BoxShadow(
                color: ThemesColor.subtitleColor.withOpacity(0.2),
                blurRadius: 4,
              )
            ],
          ),
          itemAnimationProperties: const ItemAnimationProperties(
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          navBarStyle: NavBarStyle.style10,
        );
      },
    );
  }
}
