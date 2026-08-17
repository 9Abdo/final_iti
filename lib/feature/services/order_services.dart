import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_iti/feature/models/order_model.dart';

class OrderServices {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addOrder({required Map<String, dynamic> order}) async {
    await firestore.collection("orders").add(order);
  }

   Stream<List<OrderModel>> getOrders(String userId) {
  return firestore
      .collection("orders")
      .where("userId", isEqualTo: userId)
      .snapshots()
      .map((snapshot) {
    return snapshot.docs.map((doc) {
      return OrderModel.fromFirestore(
        doc.data(),
        doc.id,
      );
    }).toList();
  });
}
Future<void> removeOrder({required String id}) async {
  await firestore.collection("orders").doc(id).delete();
}
Future<void> updateOrderStatus({
  required String id,
  required String status,
}) async {
  await firestore
      .collection("orders")
      .doc(id)
      .update({
    "status": status,
  });
}
}
