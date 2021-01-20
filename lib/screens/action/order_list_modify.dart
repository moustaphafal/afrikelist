import 'package:afrikelist/models/order.dart';
import 'package:afrikelist/screens/action/order_tile_modify.dart';
import 'package:afrikelist/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderListModify extends StatefulWidget {
  final DateTime selectedDate;
  final bool isComplete;

  const OrderListModify({this.selectedDate, this.isComplete});

  @override
  _OrderListModifyState createState() =>
      _OrderListModifyState(selectedDate, isComplete);
}

class _OrderListModifyState extends State<OrderListModify> {
  final DateTime selectedDate;
  final bool isComplete;

  _OrderListModifyState(this.selectedDate, this.isComplete);

  @override
  Widget build(BuildContext context) {
    final orderListModify = Provider.of<List<Order>>(context).reversed.toList();

    return orderListModify == null
        ? Loading()
        : ListView.builder(
            itemCount: orderListModify.length,
            itemBuilder: (context, index) {
              var currentOrder = orderListModify[index];
              DateTime orderDate = DateTime.fromMillisecondsSinceEpoch(
                  int.parse(currentOrder.orderDate));
              bool equality = orderDate.day == selectedDate.day &&
                  orderDate.year == selectedDate.year &&
                  orderDate.month == selectedDate.month;
              if (isComplete == currentOrder.isCompleted && equality) {
                return OrderTileModify(order: orderListModify[index]);
              } else {
                return SizedBox();
              }
            },
          );
  }
}
