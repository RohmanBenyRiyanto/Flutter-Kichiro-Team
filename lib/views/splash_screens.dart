import '../utils/importer.dart';

class SplashScreens extends StatelessWidget {
  const SplashScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final splashController = Get.put(
      SplashScreenController(),
    );

    return Scaffold(
      backgroundColor: ThemesColor.primaryColor,
      body: GetBuilder<SplashScreenController>(
        init: splashController,
        builder: (_) {
          return Center(
            child: Image.asset(
              'assets/img/logo.png',
              width: ThemesMargin.setWidth(
                100.h,
              ),
              height: ThemesMargin.setHeight(
                100.h,
              ),
            ),
          );
        },
      ),
    );
  }
}
