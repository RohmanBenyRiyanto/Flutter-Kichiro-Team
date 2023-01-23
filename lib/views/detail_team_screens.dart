import '../utils/importer.dart';

class DetailTeamScreens extends StatelessWidget {
  const DetailTeamScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildContent() {
      return ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: ThemesMargin.defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: ThemesMargin.verticalMargin12,
                ),
                Center(
                  child: Container(
                    height: 100.h,
                    width: 100.h,
                    decoration: const BoxDecoration(
                      color: ThemesColor.whiteColor,
                      shape: BoxShape.circle,
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/img/logo.png',
                        height: 88.h,
                        width: 88.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: ThemesMargin.verticalMargin12,
                ),
                Text(
                  'Personil',
                  style: FontStyles.body1.copyWith(
                    color: ThemesColor.darkColor,
                  ),
                ),
                SizedBox(
                  height: ThemesMargin.verticalMargin6,
                ),
                Text(
                  '1.  Hafni Mahligai Ramadhani (2013034)',
                  style: FontStyles.body3.copyWith(
                    color: ThemesColor.subtitleColor,
                  ),
                ),
                SizedBox(
                  height: ThemesMargin.verticalMargin2,
                ),
                Text(
                  '2. Dyah Aryani (20102019)',
                  style: FontStyles.body3.copyWith(
                    color: ThemesColor.subtitleColor,
                  ),
                ),
                SizedBox(
                  height: ThemesMargin.verticalMargin2,
                ),
                Text(
                  '3. Ajeng Nurdina (20103002)',
                  style: FontStyles.body3.copyWith(
                    color: ThemesColor.subtitleColor,
                  ),
                ),
                SizedBox(
                  height: ThemesMargin.verticalMargin12,
                ),
                Text(
                  'Deskripsi',
                  style: FontStyles.body1.copyWith(
                    color: ThemesColor.darkColor,
                  ),
                ),
                SizedBox(
                  height: ThemesMargin.verticalMargin6,
                ),
                Text(
                  'Kichiro Team merupakan aplikasi e commerce berbasis android yang menyediakan berbagai macam Anime merchandise. Di Kichiro Team para pecinta anime bisa menemukan berbagai macam merchandise yang dapat membantu para wibu dalam mengoleksi merchandise dari berbagai anime.',
                  style: FontStyles.caption.copyWith(
                    color: ThemesColor.subtitleColor,
                  ),
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
        title: 'Kichiro Team',
      ),
      body: buildContent(),
    );
  }
}
