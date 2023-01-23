import '../utils/importer.dart';

abstract class ThemesColor {
  static const Color primaryColor = Color(0xFFBA9EB7);
  static const Color secondaryColor = Color(0xFFF3F5F8);
  static const Color darkColor = Color(0xFF240F51);
  static const Color subtitleColor = Color(0xFF9DA5B8);
  static const Color greyColor = Color(0xFF5A6171);
  static const Color greyTwoColor = Color(0xFFD8DFE9);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color blackColor = Color(0xFF000000);
  static const Color errorColor = Color(0xFFFD3C4A);
  static const Color succesColor = Color(0xFF00A86B);
  static const Color transparentColor = Color(0x00000000);

  static List<BoxShadow> defaultCardShadow = [
    BoxShadow(
      color: greyColor.withOpacity(0.1),
      blurRadius: 8,
      offset: const Offset(0, 4),
    ),
  ];
}
