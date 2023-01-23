import '../utils/importer.dart';

abstract class ThemesMargin {
  static double defaultMargin = 16.0.w;

  //Horizontal
  static double horizontalMargin32 = 32.0.w;
  static double horizontalMargin24 = 24.0.w;
  static double horizontalMargin18 = 24.0.w;
  static double horizontalMargin16 = 16.0.w;
  static double horizontalMargin14 = 16.0.w;
  static double horizontalMargin12 = 12.0.w;
  static double horizontalMargin8 = 8.0.w;
  static double horizontalMargin6 = 6.0.w;
  static double horizontalMargin4 = 4.0.w;
  static double horizontalMargin2 = 2.0.w;

  //Vertical
  static double verticalMargin32 = 32.0.h;
  static double verticalMargin24 = 24.0.h;
  static double verticalMargin18 = 24.0.h;
  static double verticalMargin16 = 16.0.h;
  static double verticalMargin14 = 16.0.h;
  static double verticalMargin12 = 12.0.h;
  static double verticalMargin8 = 8.0.h;
  static double verticalMargin6 = 6.0.h;
  static double verticalMargin4 = 4.0.h;
  static double verticalMargin2 = 2.0.h;

  //Radius
  static BorderRadius defaultRadius =
      const BorderRadius.all(Radius.circular(8)).r;

  //set Width
  static double setWidth(double width) {
    return ScreenUtil().setWidth(width).w;
  }

  //set Height
  static double setHeight(double height) {
    return ScreenUtil().setHeight(height).h;
  }

  //Screen Width
  static double screenWidth() {
    return ScreenUtil().screenWidth;
  }

  //Screen Height
  static double screenHeight() {
    return ScreenUtil().screenHeight;
  }
}
