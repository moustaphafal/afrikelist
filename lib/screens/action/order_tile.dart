import 'package:afrikelist/models/order.dart';
import 'package:afrikelist/shared/printOrder.dart';
import 'package:flutter/material.dart';

class OrderTile extends StatefulWidget {
  final Order order;
  OrderTile({this.order});

  @override
  _OrderTileState createState() => _OrderTileState(order);
}

class _OrderTileState extends State<OrderTile> {
  final Order order;

  _OrderTileState(this.order);
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

  @override
  Widget build(BuildContext context) {
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
              MaterialPageRoute(builder: (context) => PrintOrder(order: order)),
            );
          },
        ),
      ),
    );
  }
}
