import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_iti/feature/models/home_model.dart';

class CartServices {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addtoCart({required Homemodel homemodel}) async {
    await firestore
        .collection("cart")
        .doc(homemodel.id.toString())
        .set(homemodel.toJson());
  }

  Future<void> removefromCart({required Homemodel homemodel}) async {
    await firestore
        .collection("cart")
        .doc(homemodel.id.toString())
        .delete();
  }

  Stream<List<Homemodel>> getCartProducts() {
    return firestore.collection("cart").snapshots().map((snapshot) {
      return snapshot.docs
          .map((e) => Homemodel.fromFirestore(e.data()))
          .toList();
    });
  }

  Future<void> updateQuantity({required Homemodel homemodel}) async {
    await firestore
        .collection("cart")
        .doc(homemodel.id.toString())
        .update({
      "quantity": homemodel.quantity,
    });
  }
}