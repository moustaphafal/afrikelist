import 'package:afrikelist/models/order.dart';
import 'package:afrikelist/screens/action/order_tile_modify.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderListModify extends StatefulWidget {
  @override
  _OrderListModifyState createState() => _OrderListModifyState();
}

class _OrderListModifyState extends State<OrderListModify> {
  @override
  Widget build(BuildContext context) {
    final orderListModify = Provider.of<List<Order>>(context).reversed.toList();

    return ListView.builder(
      itemCount: orderListModify.length,
      itemBuilder: (context, index) {
        // if (orderListModify[index].isShipped) {
        return OrderTileModify(order: orderListModify[index]);
        // }
      },
    );
  }
}
