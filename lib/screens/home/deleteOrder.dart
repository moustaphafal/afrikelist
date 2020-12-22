import 'package:afrikelist/models/order.dart';
import 'package:afrikelist/screens/action/order_list_delete.dart';
import 'package:afrikelist/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeleteOrder extends StatefulWidget {
  @override
  _DeleteOrderState createState() => _DeleteOrderState();
}

class _DeleteOrderState extends State<DeleteOrder> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Order>>.value(
      value: DatabaseService().orders,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Close orders'),
        ),
        body: OrderListDelete(),
      ),
    );
  }
}
