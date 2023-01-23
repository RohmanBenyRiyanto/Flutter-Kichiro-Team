// ignore_for_file: must_be_immutable

import '../utils/importer.dart';

class ButtonAction extends StatelessWidget {
  ButtonAction({
    required this.tittle,
    this.onPressed,
    this.icons,
    Key? key,
  }) : super(key: key);

  final String tittle;
  Function? onPressed;
  final String? icons;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed as void Function()?,
      child: Container(
        width: ThemesMargin.screenWidth(),
        height: 40.h,
        padding: EdgeInsets.symmetric(
          horizontal: ThemesMargin.horizontalMargin12,
          vertical: ThemesMargin.setHeight(8.0),
        ),
        decoration: BoxDecoration(
          color: ThemesColor.greyTwoColor,
          borderRadius: ThemesMargin.defaultRadius,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  icons ?? 'assets/icons/ic_edit_profile.svg',
                  color: ThemesColor.darkColor,
                  width: 16.0.h,
                ),
                SizedBox(
                  width: ThemesMargin.horizontalMargin8,
                ),
                Text(
                  tittle,
                  style: FontStyles.button.copyWith(
                    color: ThemesColor.darkColor,
                  ),
                ),
              ],
            ),
            SvgPicture.asset(
              'assets/icons/ic_arrow_right.svg',
              color: ThemesColor.darkColor,
              height: 16.0.h,
              width: 16.0.w,
              fit: BoxFit.scaleDown,
            ),
          ],
        ),
      ),
    );
  }
}
