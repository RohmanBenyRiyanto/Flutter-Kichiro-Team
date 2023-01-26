import '../utils/importer.dart';

class ProfileScreens extends StatelessWidget {
  const ProfileScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController authController = AuthController.to;

    Widget buildHeader() {
      return Container(
        height: 135.h,
        width: ThemesMargin.screenWidth(),
        color: ThemesColor.whiteColor,
        child: Stack(
          children: [
            Container(
              alignment: Alignment.topCenter,
              height: 90.h,
              width: ThemesMargin.screenWidth(),
              decoration: BoxDecoration(
                color: ThemesColor.primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(
                    20.r,
                  ),
                  bottomRight: Radius.circular(
                    20.r,
                  ),
                ),
              ),
              child: Image.asset(
                'assets/img/il_profile.png',
                width: ThemesMargin.screenWidth(),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: DottedBorder(
                borderType: BorderType.Circle,
                color: ThemesColor.greyTwoColor,
                padding: const EdgeInsets.all(4.0),
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
                      child: GetBuilder<AuthController>(
                        init: AuthController(),
                        builder: (controller) =>
                            controller.firestoreUser.value!.uid == null
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : Image.network(
                                    controller.firestoreUser.value?.photoUrl ??
                                        '',
                                    height: 88.h,
                                    width: 88.h,
                                    fit: BoxFit.cover,
                                  ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget buildContent() {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ThemesMargin.defaultMargin,
        ),
        child: GetX<AuthController>(
          init: AuthController(),
          builder: (controller) {
            return Column(
              children: [
                SizedBox(
                  height: ThemesMargin.verticalMargin6,
                ),
                Text(
                  controller.firestoreUser.value?.name ?? '',
                  style: FontStyles.body1.copyWith(
                    color: ThemesColor.darkColor,
                  ),
                ),
                Text(
                  controller.firestoreUser.value?.userName ?? '',
                  style: FontStyles.body2.copyWith(
                    color: ThemesColor.subtitleColor,
                  ),
                ),
              ],
            );
          },
        ),
      );
    }

    Widget buildAction() {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ThemesMargin.defaultMargin,
        ),
        child: Column(
          children: [
            SizedBox(
              height: ThemesMargin.verticalMargin18,
            ),
            ButtonAction(
              tittle: 'Edit Profile',
              icons: 'assets/icons/ic_edit_profile.svg',
              onPressed: () {
                Get.toNamed(RouteNames.editProfileScreens);
              },
            ),
            SizedBox(
              height: ThemesMargin.verticalMargin16,
            ),
            ButtonAction(
              tittle: 'Detail Team',
              icons: 'assets/icons/ic_detail_team.svg',
              onPressed: () {
                Get.toNamed(RouteNames.detailTeamScreens);
              },
            ),
            SizedBox(
              height: ThemesMargin.verticalMargin16,
            ),
            ButtonAction(
              tittle: 'Logout',
              icons: 'assets/icons/ic_logout.svg',
              onPressed: () {
                authController.logOut();
              },
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBars(
        backgroundColor: ThemesColor.primaryColor,
        titleColor: ThemesColor.whiteColor,
        title: 'Profile',
        useLeading: false,
      ),
      body: Column(
        children: [
          buildHeader(),
          buildContent(),
          buildAction(),
        ],
      ),
    );
  }
}
