import '../utils/importer.dart';

class RegisterScreens extends StatelessWidget {
  const RegisterScreens({super.key});

  @override
  Widget build(BuildContext context) {
    Widget buildForm() {
      return ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: ThemesMargin.defaultMargin),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: ThemesMargin.verticalMargin12,
                ),
                Text(
                  'Username',
                  style: FontStyles.subtitle2.copyWith(
                    color: ThemesColor.greyColor,
                  ),
                ),
                SizedBox(
                  height: ThemesMargin.verticalMargin8,
                ),
                const TextFormFields(
                  hintText: "Masukkan username anda",
                ),
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
                const TextFormFields(
                  hintText: "Masukkan email anda",
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
                  tag: 'register_password',
                  init: FormPasswordController(),
                  builder: (formPasswordController) {
                    return TextFormPassword(
                      hintText: "Masukkan password anda",
                      isShow: formPasswordController.isShow.value,
                      onPressed: () {
                        formPasswordController.showPassword();
                      },
                    );
                  },
                ),
                SizedBox(
                  height: ThemesMargin.verticalMargin12,
                ),
                Text(
                  'Konfirmasi Password',
                  style: FontStyles.subtitle2.copyWith(
                    color: ThemesColor.greyColor,
                  ),
                ),
                SizedBox(
                  height: ThemesMargin.verticalMargin8,
                ),
                GetX<FormPasswordController>(
                  tag: 'register_konfirmasi_password',
                  init: FormPasswordController(),
                  builder: (formPasswordController) {
                    return TextFormPassword(
                      hintText: "Konfirmasi password anda",
                      isShow: formPasswordController.isShow.value,
                      onPressed: () {
                        formPasswordController.showPassword();
                      },
                    );
                  },
                ),
                SizedBox(
                  height: ThemesMargin.verticalMargin6,
                ),
                SizedBox(
                  height: ThemesMargin.verticalMargin16,
                ),
                ButtonPrimary(
                  text: 'Daftar',
                  onPressed: () {},
                ),
                SizedBox(
                  height: ThemesMargin.verticalMargin8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sudah punya akun?',
                      style: FontStyles.overlineMedium.copyWith(
                        color: ThemesColor.subtitleColor,
                      ),
                    ),
                    SizedBox(
                      width: ThemesMargin.horizontalMargin4,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteNames.loginScreens);
                      },
                      child: Text(
                        'Login',
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
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: ThemesColor.whiteColor,
      appBar: AppBars(
        title: 'Register',
      ),
      body: buildForm(),
    );
  }
}
