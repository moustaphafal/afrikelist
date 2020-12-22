import 'package:afrikelist/models/order.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  // final String uid;
  // DatabaseService({this.uid});
  //collection reference (reference to a collection in the firestore database)
  final CollectionReference userCollection =
      Firestore.instance.collection('user');

  Future updateUserData(String uid, String name, bool isManager) async {
    return await userCollection.document(uid).setData({
      'name': name,
      'isManager': isManager,
    });
  }

  Stream<QuerySnapshot> get user {
    return userCollection.snapshots();
  }

  //method for orders
  final CollectionReference orderCollection =
      Firestore.instance.collection('order');

  Future updateOrderData(
      String id,
      String customerName,
      String customerPhone,
      String description,
      String acompte,
      String orderDate,
      String operatorName,
      bool isConfirmed,
      bool isShipped,
      String shippingDate,
      bool isCompleted,
      String completionDate) async {
    return await orderCollection.document(id).setData({
      'id': id,
      'customerName': customerName,
      'customerPhone': customerPhone,
      'description': description,
      'acompte': acompte,
      'orderDate': orderDate,
      'operatorName': operatorName,
      'isConfirmed': isConfirmed,
      'isShipped': isShipped,
      'shippingDate': shippingDate,
      'isCompleted': isCompleted,
      'completionDate': completionDate,
    });
  }

  Stream<List<Order>> get orders {
    return orderCollection.snapshots().map(_orderListFromSnapchot);
  }

  List<Order> _orderListFromSnapchot(QuerySnapshot snapchot) {
    return snapchot.documents.map((doc) {
      return Order(
        id: doc.data['id'],
        customerName: doc.data['customerName'],
        customerPhone: doc.data['customerPhone'],
        description: doc.data['description'],
        acompte: doc.data['acompte'],
        orderDate: doc.data['orderDate'],
        operatorName: doc.data['operatorName'],
        isConfirmed: doc.data['isConfirmed'],
        isShipped: doc.data['isShipped'],
        shippingDate: doc.data['shippingDate'],
        isCompleted: doc.data['isCompleted'],
        completionDate: doc.data['completionDate'],
      );
    }).toList();
  }
}
