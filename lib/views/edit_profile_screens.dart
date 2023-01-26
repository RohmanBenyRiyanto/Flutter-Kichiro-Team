import '../utils/importer.dart';

class EditProfileScreens extends StatelessWidget {
  const EditProfileScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController authController = AuthController.to;
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    authController.nameController.text =
        authController.firestoreUser.value!.name!;
    authController.usernameController.text =
        authController.firestoreUser.value!.userName!;
    authController.emailController.text =
        authController.firestoreUser.value!.email!;

    Widget buildContent() {
      return ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: ThemesMargin.defaultMargin),
            child: Form(
              key: _formKey,
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
                        hintText: "Nama Lengkap",
                        controllers: authController.nameController,
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
                        hintText: "username",
                        controllers: authController.usernameController,
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
                      ),
                      SizedBox(
                        height: ThemesMargin.verticalMargin24,
                      ),
                      ButtonPrimary(
                        text: 'Simpan',
                        onPressed: () {},
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
      ),
      body: buildContent(),
    );
  }
}
