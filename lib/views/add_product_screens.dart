import 'dart:math';

import '../utils/importer.dart';

class AddProductScreens extends StatefulWidget {
  const AddProductScreens({super.key});

  @override
  State<AddProductScreens> createState() => _AddProductScreensState();
}

class _AddProductScreensState extends State<AddProductScreens> {
  TextEditingController nameController = TextEditingController();
  TextEditingController creatorController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    creatorController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars(
        title: 'Add Product',
      ),
      body: Form(
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
                      'Nama Produk',
                      style: FontStyles.subtitle2.copyWith(
                        color: ThemesColor.greyColor,
                      ),
                    ),
                    SizedBox(
                      height: ThemesMargin.verticalMargin8,
                    ),
                    TextFormFields(
                      hintText: "Masukkan nama produk",
                      controllers: nameController,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      validator: Validator().name,
                      onChanged: (value) => null,
                      onSaved: (value) => nameController.text = value!,
                    ),
                    SizedBox(
                      height: ThemesMargin.verticalMargin12,
                    ),
                    Text(
                      'Nama Creator',
                      style: FontStyles.subtitle2.copyWith(
                        color: ThemesColor.greyColor,
                      ),
                    ),
                    SizedBox(
                      height: ThemesMargin.verticalMargin8,
                    ),
                    TextFormFields(
                      hintText: "Masukkan nama creator",
                      controllers: creatorController,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      validator: Validator().name,
                      onChanged: (value) => null,
                      onSaved: (value) => creatorController.text = value!,
                    ),
                    SizedBox(
                      height: ThemesMargin.verticalMargin12,
                    ),
                    Text(
                      'Deskripsi',
                      style: FontStyles.subtitle2.copyWith(
                        color: ThemesColor.greyColor,
                      ),
                    ),
                    SizedBox(
                      height: ThemesMargin.verticalMargin8,
                    ),
                    TextFormFields(
                      hintText: "Masukkan deskripsi produk",
                      controllers: descriptionController,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      validator: Validator().name,
                      onChanged: (value) => null,
                      onSaved: (value) => descriptionController.text = value!,
                    ),
                    SizedBox(
                      height: ThemesMargin.verticalMargin12,
                    ),
                    Text(
                      'Harga',
                      style: FontStyles.subtitle2.copyWith(
                        color: ThemesColor.greyColor,
                      ),
                    ),
                    SizedBox(
                      height: ThemesMargin.verticalMargin8,
                    ),
                    TextFormFields(
                      hintText: "Masukkan harga produk",
                      controllers: priceController,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      validator: Validator().notEmpty,
                      onChanged: (value) => null,
                      onSaved: (value) => priceController.text = value!,
                    ),
                    SizedBox(
                      height: ThemesMargin.verticalMargin12,
                    ),
                    SizedBox(
                      height: ThemesMargin.verticalMargin12,
                    ),
                  ]),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ThemesMargin.defaultMargin,
              vertical: ThemesMargin.verticalMargin12),
          child: ButtonPrimary(
            text: 'Simpan',
            onPressed: () => addProduct(),
          ),
        ),
      ),
    );
  }

  //add product to firestore
  Future<void> addProduct() async {
    //random email for gravatar
    String email = '${Random().nextInt(100000)}@gmail.com';
    Gravatar gravatar = Gravatar(email);
    String gravatarUrl = gravatar.imageUrl(
      size: 200,
      defaultImage: GravatarImage.retro,
      rating: GravatarRating.pg,
      fileExtension: true,
    );
    if (formKey.currentState!.validate() && gravatarUrl.isNotEmpty) {
      formKey.currentState!.save();
      await FirebaseFirestore.instance.collection('product').add({
        'uid': FirebaseAuth.instance.currentUser!.uid,
        'name': nameController.text,
        'creator': creatorController.text,
        'description': descriptionController.text,
        'price': priceController.text,
        'image': gravatarUrl,
      });
      Get.back();
      // show getx snackbar
      Get.snackbar(
        'Success',
        'Product Has Been Added',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: ThemesColor.succesColor,
        colorText: ThemesColor.whiteColor,
        margin: const EdgeInsets.all(8),
      );
    } else {
      // show getx snackbar
      Get.snackbar(
        'Failed',
        'Product Has Not Been Added',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: ThemesColor.errorColor,
        colorText: ThemesColor.whiteColor,
        margin: const EdgeInsets.all(8),
      );
    }
  }
}
