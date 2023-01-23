// ignore_for_file: must_be_immutable

import '../utils/importer.dart';

class ButtonPrimary extends StatelessWidget {
  ButtonPrimary({
    Key? key,
    this.text,
    required this.onPressed,
    this.height,
    this.isDisable = false,
  }) : super(key: key);

  final String? text;
  Function onPressed;
  final double? height;
  bool isDisable;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ThemesMargin.screenWidth(),
      height: height ?? 44.0.h,
      child: AbsorbPointer(
        absorbing: isDisable,
        child: ButtonTheme(
          padding: EdgeInsets.symmetric(
            vertical: ThemesMargin.verticalMargin12,
            horizontal: ThemesMargin.horizontalMargin14,
          ),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          child: Theme(
            data: Theme.of(context).copyWith(
              splashColor: ThemesColor.transparentColor,
              highlightColor: ThemesColor.transparentColor,
            ),
            child: ElevatedButton(
              onPressed: onPressed as void Function()?,
              style: ElevatedButton.styleFrom(
                backgroundColor: isDisable == true
                    ? ThemesColor.greyColor
                    : ThemesColor.primaryColor,
                foregroundColor: isDisable == true
                    ? ThemesColor.greyColor
                    : ThemesColor.primaryColor,
                shadowColor: isDisable == true
                    ? ThemesColor.greyColor
                    : ThemesColor.transparentColor,
                surfaceTintColor: isDisable == true
                    ? ThemesColor.greyColor
                    : ThemesColor.primaryColor,
                disabledBackgroundColor: isDisable == true
                    ? ThemesColor.greyColor
                    : ThemesColor.primaryColor,
                disabledForegroundColor: isDisable == true
                    ? ThemesColor.greyColor
                    : ThemesColor.primaryColor,
                splashFactory: NoSplash.splashFactory,
                elevation: 0,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shape: RoundedRectangleBorder(
                  borderRadius: ThemesMargin.defaultRadius,
                ),
              ),
              child: Text(
                text ?? 'Button',
                style: FontStyles.button.copyWith(
                  color: ThemesColor.whiteColor,
                ),
              ),
            ),
          ), //your original button
        ),
      ),
    );
  }
}
