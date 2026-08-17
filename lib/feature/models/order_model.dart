import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_iti/feature/models/home_model.dart';

class OrderModel {
  final String id;
  final String userId;
  final String status;
  final DateTime date;
  final double subtotal;
  final double delivery;
  final double total;
  final String paymentMethod;
  final List<Homemodel> products;

  OrderModel({
    required this.id,
    required this.userId,
    required this.status,
    required this.date,
    required this.subtotal,
    required this.delivery,
    required this.total,
    required this.paymentMethod,
    required this.products,
  });
// to get data from firebase
  factory OrderModel.fromFirestore(
    Map<String, dynamic> json,
    String documentId,
  ) {
    return OrderModel(
      id: documentId,
      userId: json["userId"] ?? "",
      status: json["status"] ?? "Pending",
      date: (json["date"] as Timestamp).toDate(),
      subtotal: (json["subtotal"] as num).toDouble(),
      delivery: (json["delivery"] as num).toDouble(),
      total: (json["total"] as num).toDouble(),
      paymentMethod: json["paymentMethod"] ?? "",
      products: (json["products"] as List<dynamic>? ?? [])
          .map(
            (product) => Homemodel.fromFirestore(
              Map<String, dynamic>.from(product),
            ),
          )
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "userId": userId,
      "status": status,
      "date": Timestamp.fromDate(date),
      "subtotal": subtotal,
      "delivery": delivery,
      "total": total,
      "paymentMethod": paymentMethod,
      "products": products.map((product) => product.toJson()).toList(),
    };
  }
}