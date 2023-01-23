import '../utils/importer.dart';

abstract class FontStyles {
  static TextStyle h1 = GoogleFonts.poppins(
    fontSize: 20.sp,
    fontWeight: semiBold,
  );

  static TextStyle h2 = GoogleFonts.poppins(
    fontSize: 18.sp,
    fontWeight: semiBold,
  );

  static TextStyle h3 = GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: semiBold,
  );

  static TextStyle h4 = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: semiBold,
  );

  static TextStyle h5 = GoogleFonts.poppins(
    fontSize: 12.sp,
    fontWeight: semiBold,
  );

  static TextStyle h6 = GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: medium,
  );

  static TextStyle subtitle1 = GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: regular,
  );

  static TextStyle subtitle2 = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: medium,
  );

  static TextStyle subtitle3 = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: regular,
  );

  static TextStyle body1 = GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: medium,
  );

  static TextStyle body2 = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: regular,
  );

  static TextStyle body3 = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: medium,
  );
  static TextStyle caption = GoogleFonts.poppins(
    fontSize: 12.sp,
    fontWeight: regular,
  );

  static TextStyle button = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: medium,
  );

  static TextStyle overline = GoogleFonts.poppins(
    fontSize: 12.sp,
    fontWeight: regular,
  );

  static TextStyle overlineBold = GoogleFonts.poppins(
    fontSize: 12.sp,
    fontWeight: bold,
  );

  static TextStyle overlineMedium = GoogleFonts.poppins(
    fontSize: 12.sp,
    fontWeight: medium,
  );

  static TextStyle price = GoogleFonts.poppins(
    fontSize: 10.sp,
    fontWeight: semiBold,
  );
  static TextStyle priceRegular = GoogleFonts.poppins(
    fontSize: 10.sp,
    fontWeight: regular,
  );

  static TextStyle priceMedium = GoogleFonts.poppins(
    fontSize: 10.sp,
    fontWeight: medium,
  );

  static TextStyle priceBold = GoogleFonts.poppins(
    fontSize: 10.sp,
    fontWeight: bold,
  );

  static TextStyle smallregular = GoogleFonts.poppins(
    fontSize: 8.sp,
    fontWeight: regular,
  );

  static TextStyle smallmedium = GoogleFonts.poppins(
    fontSize: 8.sp,
    fontWeight: medium,
  );

  static TextStyle smallsemiBold = GoogleFonts.poppins(
    fontSize: 8.sp,
    fontWeight: semiBold,
  );

  static TextStyle smallbold = GoogleFonts.poppins(
    fontSize: 8.sp,
    fontWeight: bold,
  );

  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
}
