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
      return Container(
        width: ThemesMargin.screenWidth(),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: ThemesColor.secondaryColor,
          borderRadius: ThemesMargin.defaultRadius,
        ),
        child: Row(
          children: [
            Container(
              height: 116.h,
              width: 100.w,
              decoration: BoxDecoration(
                color: ThemesColor.whiteColor,
                borderRadius: BorderRadius.circular(4.0.r),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4.0.r),
                child: Image.network(
                  'https://lzd-img-global.slatic.net/g/p/caaf924e28e4a62ccf39ea8cb1abdbd2.jpg_720x720q80.jpg_.webp',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: ThemesMargin.horizontalMargin8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'KAOS OVERSIZE WIBU T-SHIRT',
                        style: FontStyles.h3.copyWith(
                          color: ThemesColor.darkColor,
                          overflow: TextOverflow.ellipsis,
                        ),
                        maxLines: 2,
                      ),
                      Text(
                        'By Kichiro Team',
                        style: FontStyles.smallregular.copyWith(
                          color: ThemesColor.subtitleColor,
                        ),
                      ),
                      Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry',
                        style: FontStyles.caption.copyWith(
                          color: ThemesColor.subtitleColor,
                          overflow: TextOverflow.ellipsis,
                        ),
                        maxLines: 2,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Rp. 100.000',
                            style: FontStyles.h4.copyWith(
                              color: ThemesColor.greyColor,
                              overflow: TextOverflow.ellipsis,
                            ),
                            maxLines: 1,
                          ),
                          SizedBox(
                            width: ThemesMargin.horizontalMargin8,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                              vertical: 8.0,
                            ),
                            decoration: BoxDecoration(
                              color: ThemesColor.primaryColor,
                              borderRadius: BorderRadius.circular(4.0.r),
                            ),
                            child: Text(
                              'Add to cart',
                              style: FontStyles.overlineMedium.copyWith(
                                color: ThemesColor.whiteColor,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
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
            ],
          ),
        ),
      ),
    );
  }
}
