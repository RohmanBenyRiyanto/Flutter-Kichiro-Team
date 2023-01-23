import '../utils/importer.dart';

// ignore: must_be_immutable
class TextFormPassword extends StatelessWidget {
  TextFormPassword({
    Key? key,
    this.hintText,
    required this.isShow,
    required this.onPressed,
    this.controllers,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.focusNode,
    this.textInputAction,
  }) : super(key: key);

  final String? hintText;
  bool isShow = false;
  final Function onPressed;
  TextEditingController? controllers;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final Function(String?)? onSaved;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controllers,
      style: FontStyles.body2.copyWith(
        color: ThemesColor.darkColor,
      ),
      obscureText: isShow,
      cursorColor: ThemesColor.primaryColor,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: keyboardType,
      validator: validator,
      onChanged: onChanged,
      onSaved: onSaved,
      focusNode: focusNode,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        isCollapsed: true,
        isDense: true,
        hintText: hintText ?? 'Masukkan password anda',
        hintStyle: FontStyles.body2.copyWith(
          color: ThemesColor.subtitleColor,
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: ThemesMargin.horizontalMargin14,
          vertical: ThemesMargin.setHeight(11.0),
        ),
        border: OutlineInputBorder(
          borderRadius: ThemesMargin.defaultRadius,
          borderSide: BorderSide(
            width: 1.5.w,
            color: ThemesColor.greyTwoColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: ThemesMargin.defaultRadius,
          borderSide: BorderSide(
            width: 1.5.w,
            color: ThemesColor.greyTwoColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: ThemesMargin.defaultRadius,
          borderSide: BorderSide(
            width: 1.5.w,
            color: ThemesColor.primaryColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: ThemesMargin.defaultRadius,
          borderSide: BorderSide(
            width: 1.0.w,
            color: ThemesColor.errorColor,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: ThemesMargin.defaultRadius,
          borderSide: BorderSide(
            width: 1.5.w,
            color: ThemesColor.errorColor,
          ),
        ),
        errorStyle: FontStyles.caption.copyWith(
          color: ThemesColor.errorColor,
        ),
        suffixIcon: GestureDetector(
          onTap: onPressed as void Function()?,
          child: SvgPicture.asset(
            isShow != false
                ? 'assets/icons/ic_eye_hide.svg'
                : 'assets/icons/ic_eye_show.svg',
            height: 24.h,
            width: 24.h,
            fit: BoxFit.scaleDown,
            color: isShow != false
                ? ThemesColor.subtitleColor
                : ThemesColor.primaryColor,
          ),
        ),
      ),
    );
  }
}
