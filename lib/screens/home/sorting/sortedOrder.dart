import 'package:afrikelist/models/order.dart';
import 'package:afrikelist/screens/action/order_list_modify.dart';
import 'package:afrikelist/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SortedOrder extends StatefulWidget {
  final bool monthOrder;

  final DateTime selectedDate;
  final bool isComplete;
  const SortedOrder({this.selectedDate, this.isComplete, this.monthOrder});
  @override
  _SortedOrderState createState() => _SortedOrderState(
      selectedDate: selectedDate,
      isComplete: isComplete,
      monthOrder: monthOrder);
}

class _SortedOrderState extends State<SortedOrder> {
  final bool monthOrder;

  final DateTime selectedDate;
  final bool isComplete;
  _SortedOrderState({this.monthOrder, this.isComplete, this.selectedDate});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Order>>.value(
      value: DatabaseService().orders,
      child: Scaffold(
        appBar: AppBar(
          title: isComplete ? Text("Completed orders") : Text("Ongoing orders"),
        ),
        body: OrderListModify(
          selectedDate: selectedDate,
          isComplete: isComplete,
          monthOrder: monthOrder,
        ),
      ),
    );
  }
}
