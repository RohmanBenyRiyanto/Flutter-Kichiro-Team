import '../utils/importer.dart';

class HomeScreens extends StatelessWidget {
  const HomeScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildHeader() {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: ThemesMargin.verticalMargin12,
          ),
          Text(
            'Kichiro Team',
            style: FontStyles.h1.copyWith(
              color: ThemesColor.darkColor,
            ),
          ),
          SizedBox(
            height: ThemesMargin.verticalMargin2,
          ),
          Text(
            "Perfect team",
            style: FontStyles.subtitle3.copyWith(
              color: ThemesColor.subtitleColor,
            ),
          ),
        ],
      );
    }

    Widget buildSearch() {
      return Container(
        height: 44.0,
        padding: EdgeInsets.symmetric(
          horizontal: ThemesMargin.defaultMargin,
        ),
        margin: EdgeInsets.symmetric(
          vertical: ThemesMargin.verticalMargin12,
        ),
        decoration: BoxDecoration(
          color: ThemesColor.secondaryColor,
          borderRadius: ThemesMargin.defaultRadius,
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                style: FontStyles.body2.copyWith(
                  color: ThemesColor.darkColor,
                ),
                cursorColor: ThemesColor.primaryColor,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search...",
                  hintStyle: FontStyles.body2.copyWith(
                    color: ThemesColor.subtitleColor,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: ThemesMargin.horizontalMargin8,
            ),
            Container(
              height: 32.0,
              width: 32.0,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: ThemesColor.primaryColor,
                borderRadius: BorderRadius.circular(4.0.r),
              ),
              child: SvgPicture.asset(
                'assets/icons/ic_search.svg',
              ),
            )
          ],
        ),
      );
    }

    Widget buildContent() {
      return ListView.separated(
        separatorBuilder: (context, index) {
          return SizedBox(
            height: ThemesMargin.verticalMargin12,
          );
        },
        itemCount: 10,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return const CardProduct();
        },
      );
    }

    return Scaffold(
      backgroundColor: ThemesColor.whiteColor,
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: ThemesMargin.defaultMargin,
            ),
            children: [
              buildHeader(),
              buildSearch(),
              buildContent(),
              SizedBox(
                height: ThemesMargin.verticalMargin24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
