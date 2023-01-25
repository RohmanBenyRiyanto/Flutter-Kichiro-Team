import '../utils/importer.dart';

class LoginScreens extends StatelessWidget {
  const LoginScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController loginController = AuthController.to;
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    Widget buildHeading() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: ThemesMargin.verticalMargin12,
          ),
          Text(
            'Login Akun',
            style: FontStyles.h1.copyWith(
              color: ThemesColor.darkColor,
            ),
          ),
          SizedBox(
            height: ThemesMargin.verticalMargin2,
          ),
          Text(
            "Selamat datang! masukkan,\nEmail dan password untuk login.",
            style: FontStyles.subtitle3.copyWith(
              color: ThemesColor.subtitleColor,
            ),
          ),
        ],
      );
    }

    Widget buildForm() {
      return Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: ThemesMargin.verticalMargin12,
            ),
            Text(
              'Email',
              style: FontStyles.subtitle2.copyWith(
                color: ThemesColor.greyColor,
              ),
            ),
            SizedBox(
              height: ThemesMargin.verticalMargin8,
            ),
            TextFormFields(
              hintText: "Masukkan email anda",
              controllers: loginController.emailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              validator: Validator().email,
              onChanged: (value) => null,
              onSaved: (value) => loginController.emailController.text = value!,
            ),
            SizedBox(
              height: ThemesMargin.verticalMargin12,
            ),
            Text(
              'Password',
              style: FontStyles.subtitle2.copyWith(
                color: ThemesColor.greyColor,
              ),
            ),
            SizedBox(
              height: ThemesMargin.verticalMargin8,
            ),
            GetX<FormPasswordController>(
              tag: 'login_password',
              init: FormPasswordController(),
              builder: (formPasswordController) {
                return TextFormPassword(
                  hintText: "Masukkan password anda",
                  isShow: formPasswordController.isShow.value,
                  onPressed: () {
                    formPasswordController.showPassword();
                  },
                  controllers: loginController.passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  validator: Validator().password,
                  onChanged: (value) => null,
                  onSaved: (value) =>
                      loginController.passwordController.text = value!,
                );
              },
            ),
            SizedBox(
              height: ThemesMargin.verticalMargin6,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Lupa password?',
                  style: FontStyles.overlineMedium.copyWith(
                    color: ThemesColor.greyColor,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: ThemesMargin.verticalMargin16,
            ),
            ButtonPrimary(
              text: 'Masuk',
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  SystemChannels.textInput.invokeMethod('TextInput.hide');
                  await loginController.signInWithEmailAndPassword(context);
                }
              },
            ),
            SizedBox(
              height: ThemesMargin.verticalMargin8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Belum punya akun?',
                  style: FontStyles.overlineMedium.copyWith(
                    color: ThemesColor.subtitleColor,
                  ),
                ),
                SizedBox(
                  width: ThemesMargin.horizontalMargin4,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteNames.registerScreens);
                  },
                  child: Text(
                    'Daftar',
                    style: FontStyles.overlineMedium.copyWith(
                      color: ThemesColor.greyColor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: ThemesMargin.verticalMargin24,
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: ThemesColor.whiteColor,
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: ThemesMargin.defaultMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildHeading(),
                  buildForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
