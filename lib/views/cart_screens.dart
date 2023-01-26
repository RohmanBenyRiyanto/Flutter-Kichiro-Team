// ignore_for_file: use_build_context_synchronously

import '../utils/importer.dart';

class CartScreens extends StatefulWidget {
  const CartScreens({Key? key}) : super(key: key);

  @override
  State<CartScreens> createState() => _CartScreensState();
}

class _CartScreensState extends State<CartScreens> {
  CollectionReference productsCollection =
      FirebaseFirestore.instance.collection('cart');
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
              return CardProduct(
                produkModel: ProdukModel(
                  uid: snapshot.data!.docs[index].id,
                  name: data['name'],
                  description: data['description'],
                  price: data['price'],
                  image: data['image'],
                  creator: data['creator'],
                ),
                buttonTitle: 'Delete',
                onPressed: () async {
                  try {
                    await FirebaseFirestore.instance
                        .collection('cart')
                        .doc(snapshot.data!.docs[index].id)
                        .delete();
                    //show getx snackbar
                    Get.snackbar(
                      'Success',
                      'Delete Success',
                      backgroundColor: ThemesColor.succesColor,
                      colorText: ThemesColor.whiteColor,
                      snackPosition: SnackPosition.BOTTOM,
                      margin: const EdgeInsets.all(8),
                    );
                  } catch (e) {
                    if (kDebugMode) {
                      print(e);
                      //show getx snackbar
                      Get.snackbar(
                        'Error',
                        e.toString(),
                        backgroundColor: ThemesColor.errorColor,
                        colorText: ThemesColor.whiteColor,
                        snackPosition: SnackPosition.BOTTOM,
                        margin: const EdgeInsets.all(8),
                      );
                    }
                  }
                },
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
