import '../utils/importer.dart';

class EditProfileScreens extends StatelessWidget {
  const EditProfileScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController authController = AuthController.to;
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    final FormPasswordController formPasswordController =
        Get.put(FormPasswordController(), tag: 'updateUser');

    authController.nameController.text =
        authController.firestoreUser.value!.name!;
    authController.usernameController.text =
        authController.firestoreUser.value!.userName!;
    authController.emailController.text =
        authController.firestoreUser.value!.email!;

    final TextEditingController password = TextEditingController();

    Future<void> updateUserConfirm(
        BuildContext context, UserModel updatedUser, String oldEmail) async {
      final AuthController authController = AuthController.to;

      return Get.dialog(
        AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          title: const Text(
            'Massukkan Password',
          ),
          content: GetX<FormPasswordController>(
            tag: 'updateUser',
            init: FormPasswordController(),
            builder: (_) {
              return TextFormPassword(
                hintText: "Password",
                isShow: formPasswordController.isShow.value,
                onPressed: () {
                  formPasswordController.showPassword();
                },
                controllers: password,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                validator: (value) {
                  String pattern = r'^.{6,}$';
                  RegExp regex = RegExp(pattern);
                  if (!regex.hasMatch(value!)) {
                    return 'Minimal 6 karakter';
                  } else {
                    return null;
                  }
                },
                onChanged: (value) => null,
                onSaved: (value) => password.text = value!,
              );
            },
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Batal'),
              onPressed: () {
                Get.back();
              },
            ),
            TextButton(
              child: const Text('Update'),
              onPressed: () async {
                Get.back();
                await authController.updateProfile(
                    context, updatedUser, oldEmail, password.text);
                authController.streamFirestoreUser();
              },
            )
          ],
        ),
      );
    }

    Widget buildContent() {
      return ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: ThemesMargin.defaultMargin),
            child: Form(
              key: formKey,
              child: GetBuilder<AuthController>(
                init: AuthController(),
                builder: (controller) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: ThemesMargin.verticalMargin12,
                      ),
                      Center(
                        child: SizedBox(
                          height: ThemesMargin.setHeight(80),
                          width: ThemesMargin.setHeight(80),
                          child: Stack(
                            children: [
                              DottedBorder(
                                borderType: BorderType.Circle,
                                color: ThemesColor.greyTwoColor,
                                padding: const EdgeInsets.all(2.0),
                                strokeWidth: 2,
                                dashPattern: const [5, 5],
                                child: Center(
                                  child: Container(
                                    height: 88.h,
                                    width: 88.h,
                                    decoration: const BoxDecoration(
                                      color: ThemesColor.whiteColor,
                                      shape: BoxShape.circle,
                                    ),
                                    child: ClipOval(
                                      child:
                                          controller.firestoreUser.value!.uid ==
                                                  null
                                              ? const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                )
                                              : Image.network(
                                                  controller.firestoreUser.value
                                                          ?.photoUrl ??
                                                      '',
                                                  height: 90.h,
                                                  width: 90.h,
                                                  fit: BoxFit.cover,
                                                ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 4,
                                right: 4,
                                child: SvgPicture.asset(
                                  'assets/icons/ic_change_photos.svg',
                                  height: 22.h,
                                  width: 22.h,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
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
                        hintText: "Masukan nama lengkap",
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        controllers: authController.nameController,
                        validator: Validator().name,
                        onSaved: (value) =>
                            authController.nameController.text = value!,
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
                        hintText: "Masukan username",
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        controllers: authController.usernameController,
                        validator: Validator().username,
                        onChanged: (value) => null,
                        onSaved: (value) =>
                            authController.usernameController.text = value!,
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
                        hintText: "email@gmail.com",
                        controllers: authController.emailController,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.emailAddress,
                        validator: Validator().email,
                        onChanged: (value) => null,
                        onSaved: (value) =>
                            authController.emailController.text = value!,
                      ),
                      SizedBox(
                        height: ThemesMargin.verticalMargin24,
                      ),
                      ButtonPrimary(
                        text: 'Simpan',
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            SystemChannels.textInput
                                .invokeMethod('TextInput.hide');
                            formKey.currentState!.save();
                            UserModel user = UserModel(
                              uid: authController.firestoreUser.value!.uid,
                              name: authController.nameController.text.trim(),
                              userName:
                                  authController.usernameController.text.trim(),
                              email: authController.emailController.text.trim(),
                              photoUrl:
                                  authController.firestoreUser.value!.photoUrl,
                              createdAt:
                                  authController.firestoreUser.value!.createdAt,
                              updatedAt: Timestamp.now(),
                            );
                            updateUserConfirm(context, user,
                                authController.emailController.text.trim());
                          }
                        },
                      ),
                      SizedBox(
                        height: ThemesMargin.verticalMargin24,
                      )
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: ThemesColor.whiteColor,
      appBar: AppBars(
          title: 'Edit Profile',
          onPressed: () {
            Get.back();
            authController.nameController.clear();
            authController.usernameController.clear();
            authController.emailController.clear();
            password.clear();
          }),
      body: buildContent(),
    );
  }
}
