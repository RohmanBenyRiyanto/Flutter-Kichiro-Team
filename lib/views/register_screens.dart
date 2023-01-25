import '../utils/importer.dart';

class RegisterScreens extends StatelessWidget {
  const RegisterScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController registerController = AuthController.to;
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    Widget buildForm() {
      return Form(
        key: formKey,
        child: ScrollConfiguration(
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
                    'Nama',
                    style: FontStyles.subtitle2.copyWith(
                      color: ThemesColor.greyColor,
                    ),
                  ),
                  SizedBox(
                    height: ThemesMargin.verticalMargin8,
                  ),
                  TextFormFields(
                    hintText: "Masukkan nama anda",
                    controllers: registerController.nameController,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    validator: Validator().name,
                    onChanged: (value) => null,
                    onSaved: (value) =>
                        registerController.nameController.text = value!,
                  ),
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
                  TextFormFields(
                    hintText: "Masukkan username anda",
                    controllers: registerController.usernameController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    validator: Validator().username,
                    onChanged: (value) => null,
                    onSaved: (value) =>
                        registerController.usernameController.text = value!,
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
                  TextFormFields(
                    hintText: "Masukkan email anda",
                    controllers: registerController.emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validator: Validator().email,
                    onChanged: (value) => null,
                    onSaved: (value) =>
                        registerController.emailController.text = value!,
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
                        controllers: registerController.passwordController,
                        validator: Validator().password,
                        onChanged: (value) => null,
                        onSaved: (value) =>
                            registerController.passwordController.text = value!,
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
                        controllers:
                            registerController.confirmPasswordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return ("Masukkan password anda!");
                          } else if (value !=
                              registerController
                                  .passwordController.value.text) {
                            return ("Password tidak sama!");
                          } else {
                            return null;
                          }
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
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        SystemChannels.textInput.invokeMethod('TextInput.hide');
                        await registerController.registerEmailPassword(context);
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
