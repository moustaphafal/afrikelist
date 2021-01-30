import 'package:afrikelist/models/order.dart';
import 'package:afrikelist/screens/action/order_list_modify.dart';
import 'package:afrikelist/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ModifyOrder extends StatefulWidget {
  final DateTime selectedDate;
  final bool isComplete;
  final bool monthOrder;
  const ModifyOrder({this.selectedDate, this.isComplete, this.monthOrder});
  @override
  _ModifyOrderState createState() =>
      _ModifyOrderState(selectedDate, isComplete, monthOrder);
}

class _ModifyOrderState extends State<ModifyOrder> {
  final DateTime selectedDate;
  final bool isComplete;
  final bool monthOrder;

  _ModifyOrderState(this.selectedDate, this.isComplete, this.monthOrder);
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Order>>.value(
      value: DatabaseService().orders,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Modify orders'),
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
