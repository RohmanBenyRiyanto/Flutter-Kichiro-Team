// ignore_for_file: use_build_context_synchronously

import '../utils/importer.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({Key? key}) : super(key: key);

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  CollectionReference productsCollection =
      FirebaseFirestore.instance.collection('product');

  //auth controller
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
      return StreamBuilder<QuerySnapshot>(
        stream: productsCollection.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: snapshot.data!.docs.length,
            separatorBuilder: (context, index) {
              return SizedBox(
                height: ThemesMargin.verticalMargin12,
              );
            },
            itemBuilder: (context, index) {
              Map<String, dynamic> data =
                  snapshot.data!.docs[index].data()! as Map<String, dynamic>;
              return Dismissible(
                key: Key(snapshot.data!.docs[index].id),
                background: Container(
                  color: ThemesColor.errorColor,
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 16.0),
                        child: Icon(
                          Icons.delete,
                          color: ThemesColor.whiteColor,
                        ),
                      ),
                    ),
                  ),
                ),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  //delete product from collection product
                  productsCollection
                      .doc(snapshot.data!.docs[index].id)
                      .delete();
                  //show getx snackbar
                  Get.snackbar(
                    'Success',
                    'Product deleted',
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: ThemesColor.succesColor,
                    colorText: ThemesColor.whiteColor,
                    margin: const EdgeInsets.all(16.0),
                  );
                },
                child: CardProduct(
                  produkModel: ProdukModel(
                    uid: snapshot.data!.docs[index].id,
                    name: data['name'],
                    description: data['description'],
                    price: data['price'],
                    image: data['image'],
                    creator: data['creator'],
                  ),
                  onPressed: () async {
                    //add product to collection cart
                    try {
                      await FirebaseFirestore.instance
                          .collection('cart')
                          .doc(snapshot.data!.docs[index].id)
                          .set(
                        {
                          'uid': snapshot.data!.docs[index].id,
                          'userId': FirebaseAuth.instance.currentUser!.uid,
                          'name': data['name'],
                          'description': data['description'],
                          'price': data['price'],
                          'image': data['image'],
                          'creator': data['creator'],
                        },
                      );
                      //show getx snackbar
                      Get.snackbar(
                        'Success',
                        'Product added to cart',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: ThemesColor.succesColor,
                        colorText: ThemesColor.whiteColor,
                        margin: const EdgeInsets.all(8),
                      );
                    } catch (e) {
                      if (kDebugMode) {
                        print(e);
                      }
                      //show getx snackbar
                      Get.snackbar(
                        'Failed',
                        'Failed to add product to cart',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: ThemesColor.errorColor,
                        colorText: ThemesColor.whiteColor,
                        margin: const EdgeInsets.all(8),
                      );
                    }
                  },
                ),
              );
            },
          );
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(RouteNames.addProductScreens);
        },
        backgroundColor: ThemesColor.primaryColor,
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
