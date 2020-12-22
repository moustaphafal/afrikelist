import 'package:afrikelist/models/order.dart';
import 'package:afrikelist/screens/action/order_list_modify.dart';
import 'package:afrikelist/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ModifyOrder extends StatefulWidget {
  @override
  _ModifyOrderState createState() => _ModifyOrderState();
}

class _ModifyOrderState extends State<ModifyOrder> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Order>>.value(
      value: DatabaseService().orders,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Modify orders'),
        ),
        body: OrderListModify(),
      ),
    );
  }
}
