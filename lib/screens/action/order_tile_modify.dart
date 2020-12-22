import 'package:afrikelist/models/order.dart';
import 'package:afrikelist/screens/action/modifyOrder.dart';
import 'package:flutter/material.dart';

class OrderTileModify extends StatelessWidget {
  final Order order;
  MaterialColor setColor(Order order) {
    if (order.isCompleted) {
      return Colors.green;
    }
    if (order.isShipped) {
      return Colors.orange;
    }
    if (order.isConfirmed) {
      return Colors.red;
    }
    return Colors.red;
  }

  OrderTileModify({this.order});
  @override
  Widget build(BuildContext context) {
    // if (!order.isShipped) {
    //   return SizedBox();
    // }
    // if (order.isCompleted) {
    //   return SizedBox();
    // }
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: setColor(order),
          ),
          title: Text(order.id),
          subtitle: Text(order.description),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ModifyOneOrder(order)),
            );
          },
        ),
      ),
    );
  }
}
