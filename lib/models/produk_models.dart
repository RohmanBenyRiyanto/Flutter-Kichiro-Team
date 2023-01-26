import '../utils/importer.dart';

class ProdukModel {
  final String uid;
  final String name;
  final String description;
  final String price;
  final String image;
  final String creator;
  ProdukModel({
    required this.uid,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.creator,
  });

  factory ProdukModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    return ProdukModel(
      uid: doc.id,
      name: doc['name'],
      description: doc['description'],
      price: doc['price'],
      image: doc['image'],
      creator: doc['creator'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'description': description,
      'price': price,
      'image': image,
      'creator': creator,
    };
  }
}
