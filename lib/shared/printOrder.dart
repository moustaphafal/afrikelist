import 'package:afrikelist/models/order.dart';
import 'package:afrikelist/shared/orderCard.dart';
import 'package:flutter/material.dart';

class PrintOrder extends StatefulWidget {
  final Order order;

  const PrintOrder({this.order});
  @override
  _PrintOrderState createState() => _PrintOrderState(this.order);
}

class _PrintOrderState extends State<PrintOrder> {
  final Order order;

  _PrintOrderState(this.order);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order: ' + order.id),
      ),
      body: ListView(
        children: <Widget>[
          OrderCard(context, "customer name", order.customerName),
          SizedBox(height: 10),
          OrderCard(context, "customer Phone", order.customerPhone),
          SizedBox(height: 10),
          OrderCard(context, "description", order.description),
          SizedBox(height: 10),
          OrderCard(context, "acompte", order.acompte),
          SizedBox(height: 10),
          OrderCard(context, "operator Name", order.operatorName),
          SizedBox(height: 10),
          OrderCard(context, "order Date", order.orderDate),
          SizedBox(height: 10),
          OrderCard(context, "shippingDate", order.shippingDate),
          SizedBox(height: 10),
          OrderCard(context, "completionDate", order.completionDate),
        ],
      ),
    );
  }
}
