import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_iti/feature/models/home_model.dart';

class FavouriteServices {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addFavouriteService({required Homemodel homemodel}) async {
    await firestore
        .collection("Favourite")
        .doc(homemodel.id.toString())
        .set(homemodel.toJson());
  }

  Future<void> removeFavouriteService({required Homemodel homemodel}) async {
    await firestore
        .collection("Favourite")
        .doc(homemodel.id.toString())
        .delete();
  }

  Stream<List<Homemodel>> getFavouriteServices() {
    return firestore
        .collection("Favourite")
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Homemodel.fromFirestore(doc.data()))
            .toList());
  }
}
