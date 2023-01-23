import '../utils/importer.dart';

class TextFormFields extends StatelessWidget {
  const TextFormFields({
    Key? key,
    this.hintText,
    this.controllers,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.focusNode,
    this.textInputAction,
    this.onPressed,
    this.onFieldSubmitted,
    this.maxLength,
    this.minLines = 1,
    this.maxLines = 1,
  }) : super(key: key);

  final String? hintText;
  final TextEditingController? controllers;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final Function(String?)? onSaved;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final Function()? onPressed;
  final Function(String)? onFieldSubmitted;
  final int? maxLength;
  final int? minLines;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onPressed,
      controller: controllers,
      style: FontStyles.body2.copyWith(
        color: ThemesColor.darkColor,
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: keyboardType,
      validator: validator,
      onChanged: onChanged,
      onSaved: onSaved,
      focusNode: focusNode,
      textInputAction: textInputAction,
      cursorColor: ThemesColor.primaryColor,
      onFieldSubmitted: onFieldSubmitted,
      maxLength: maxLength,
      minLines: minLines,
      maxLines: maxLines,
      decoration: InputDecoration(
        isCollapsed: true,
        isDense: true,
        counterText: "",
        hintText: hintText ?? 'Hint Text',
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
      ),
    );
  }
}
