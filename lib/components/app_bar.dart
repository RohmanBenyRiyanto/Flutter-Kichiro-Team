// ignore_for_file: must_be_immutable

import '../utils/importer.dart';

class AppBars extends StatelessWidget implements PreferredSizeWidget {
  AppBars({
    Key? key,
    this.title,
    this.onPressed,
    this.actions,
    this.useLeading = true,
    this.backgroundColor = ThemesColor.whiteColor,
    this.titleColor = ThemesColor.darkColor,
    this.widgetTittle,
  }) : super(key: key);

  final String? title;
  final bool? useLeading;
  Function? onPressed;
  Color backgroundColor;
  Color titleColor;
  final List<Widget>? actions;
  final Widget? widgetTittle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: backgroundColor,
      centerTitle: widgetTittle == null ? true : false,
      title: widgetTittle ??
          Text(
            title ?? 'Tittle',
            style: FontStyles.body1.copyWith(
              color: titleColor,
            ),
          ),
      leading: useLeading == true
          ? GestureDetector(
              onTap: (() {
                onPressed != null ? onPressed!() : Get.back();
              }),
              child: Container(
                height: 18.h,
                color: backgroundColor,
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 18,
                  color: ThemesColor.darkColor,
                ),
              ),
            )
          : null,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
