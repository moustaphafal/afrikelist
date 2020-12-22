import 'package:afrikelist/models/order.dart';
import 'package:afrikelist/screens/action/order_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderList extends StatefulWidget {
  @override
  _OrderListState createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  @override
  Widget build(BuildContext context) {
    final orderList = Provider.of<List<Order>>(context);

    return ListView.builder(
      itemCount: orderList != null ? orderList.toList().length : 0,
      itemBuilder: (context, index) {
        return OrderTile(order: orderList.toList()[index]);
      },
    );
  }
}
