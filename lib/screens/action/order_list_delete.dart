import 'package:afrikelist/models/order.dart';
import 'package:afrikelist/screens/action/order_tile_delete.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderListDelete extends StatefulWidget {
  @override
  _OrderListDeleteState createState() => _OrderListDeleteState();
}

class _OrderListDeleteState extends State<OrderListDelete> {
  @override
  Widget build(BuildContext context) {
    final orderListDelete = Provider.of<List<Order>>(context);
    return ListView.builder(
      itemCount: orderListDelete != null ? orderListDelete.toList().length : 0,
      itemBuilder: (context, index) {
        // if (orderListDelete[index].isShipped) {
        return OrderTileDelete(order: orderListDelete.toList()[index]);
        // }
      },
    );
  }
}
