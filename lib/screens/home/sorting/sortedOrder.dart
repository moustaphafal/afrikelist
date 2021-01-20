import 'package:afrikelist/models/order.dart';
import 'package:afrikelist/screens/action/order_list_modify.dart';
import 'package:afrikelist/screens/home/allOrders.dart';
import 'package:afrikelist/screens/home/modifyOrder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SortedOrder extends StatefulWidget {
  final DateTime selectedDate;
  final bool isComplete;
  const SortedOrder({this.selectedDate, this.isComplete});
  @override
  _SortedOrderState createState() =>
      _SortedOrderState(selectedDate: selectedDate, isComplete: isComplete);
}

class _SortedOrderState extends State<SortedOrder> {
  final DateTime selectedDate;
  final bool isComplete;
  _SortedOrderState({this.isComplete, this.selectedDate});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Order>>.value(
      value: null,
      child: Scaffold(
        body: ModifyOrder(
          selectedDate: selectedDate,
          isComplete: isComplete,
        ),
      ),
    );
  }
}
