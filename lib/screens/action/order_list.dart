import 'package:afrikelist/models/order.dart';
import 'package:afrikelist/screens/action/order_tile_modify.dart';
import 'package:afrikelist/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:grouped_list/grouped_list.dart';

class OrderList extends StatefulWidget {
  @override
  _OrderListState createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  @override
  Widget build(BuildContext context) {
    final orderList = Provider.of<List<Order>>(context);

    return orderList == null
        ? Loading()
        : GroupedListView<dynamic, String>(
            elements: orderList,
            groupBy: (element) =>
                DateTime.fromMillisecondsSinceEpoch(
                        int.parse(element.orderDate))
                    .day
                    .toString() +
                "/" +
                DateTime.fromMillisecondsSinceEpoch(
                        int.parse(element.orderDate))
                    .month
                    .toString() +
                "/" +
                DateTime.fromMillisecondsSinceEpoch(
                        int.parse(element.orderDate))
                    .year
                    .toString(),
            groupSeparatorBuilder: (String value) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(value,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            itemBuilder: (context, dynamic element) => OrderTileModify(
              order: element,
            ),
            // itemComparator: (item1, item2) =>
            //     item1['name'].compareTo(item2['name']), // optional
            // useStickyGroupSeparators: true, // optional
            floatingHeader: true, // optional
            order: GroupedListOrder.DESC, // optional
          );
  }
}
