import '../utils/importer.dart';

class CartScreens extends StatelessWidget {
  const CartScreens({Key? key}) : super(key: key);

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
            'Cart',
            style: FontStyles.h1.copyWith(
              color: ThemesColor.darkColor,
            ),
          ),
          SizedBox(
            height: ThemesMargin.verticalMargin12,
          ),
        ],
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
          return const CardCart();
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
