import 'package:afrikelist/models/order.dart';
import 'package:afrikelist/screens/action/order_tile_modify.dart';
import 'package:afrikelist/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:provider/provider.dart';

class OrderListModify extends StatefulWidget {
  final bool monthOrder;
  final DateTime selectedDate;
  final bool isComplete;

  const OrderListModify({this.selectedDate, this.isComplete, this.monthOrder});

  @override
  _OrderListModifyState createState() =>
      _OrderListModifyState(selectedDate, isComplete, monthOrder);
}

class _OrderListModifyState extends State<OrderListModify> {
  bool monthOrder;
  final DateTime selectedDate;
  final bool isComplete;

  _OrderListModifyState(this.selectedDate, this.isComplete, this.monthOrder);
  List<Order> remove(List<Order> list) {
    list.removeWhere((element) {
      var currentOrder = element;
      DateTime orderDate = DateTime.fromMillisecondsSinceEpoch(
          int.parse(currentOrder.orderDate));
      bool equality = false;
      if (monthOrder) {
        equality = orderDate.year == selectedDate.year &&
            orderDate.month == selectedDate.month;
      } else {
        equality = orderDate.day == selectedDate.day &&
            orderDate.year == selectedDate.year &&
            orderDate.month == selectedDate.month;
      }

      if (isComplete == currentOrder.isCompleted && equality) {
        return false;
      } else {
        return true;
      }
    });
    list.sort((b, a) => a.completionDate.compareTo(b.completionDate));
    return list;
  }

  List<Order> removeCompleted(List<Order> list) {
    list.removeWhere((element) {
      return element.isCompleted == true;
    });
    list.sort((b, a) => a.completionDate.compareTo(b.completionDate));
    return list.reversed.toList();
  }

  @override
  Widget build(BuildContext context) {
    final orderListModify = Provider.of<List<Order>>(context);
    return orderListModify == null
        ? Loading()
        : selectedDate == null
            ? seeOngoing(orderListModify)
            : seeCompleted(orderListModify);
  }

  GroupedListView<Order, String> seeCompleted(List<Order> orderListModify) {
    return GroupedListView<Order, String>(
      elements: remove(orderListModify).reversed.toList(),
      order: GroupedListOrder.DESC,
      groupBy: (element) =>
          DateTime.fromMillisecondsSinceEpoch(int.parse(element.orderDate))
              .day
              .toString() +
          "/" +
          DateTime.fromMillisecondsSinceEpoch(int.parse(element.orderDate))
              .month
              .toString() +
          "/" +
          DateTime.fromMillisecondsSinceEpoch(int.parse(element.orderDate))
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
      // itemCount: orderListModify.length,
      itemBuilder: (context, dynamic element) {
        return OrderTileModify(order: element);
      },
    );
  }

  GroupedListView<Order, String> seeOngoing(List<Order> orderListModify) {
    return GroupedListView<Order, String>(
      elements: removeCompleted(orderListModify).reversed.toList(),
      order: GroupedListOrder.DESC,
      useStickyGroupSeparators: true, // optional
      floatingHeader: true,
      groupBy: (element) =>
          DateTime.fromMillisecondsSinceEpoch(int.parse(element.orderDate))
              .day
              .toString() +
          "/" +
          DateTime.fromMillisecondsSinceEpoch(int.parse(element.orderDate))
              .month
              .toString() +
          "/" +
          DateTime.fromMillisecondsSinceEpoch(int.parse(element.orderDate))
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
      // itemCount: orderListModify.length,
      itemBuilder: (context, dynamic element) {
        return OrderTileModify(order: element);
      },
    );
  }
}

// GroupedListView<dynamic, String>(
//       elements: orderList,
//       groupBy: (element) =>
//           DateTime.fromMillisecondsSinceEpoch(int.parse(element.orderDate))
//               .day
//               .toString() +
//           "/" +
//           DateTime.fromMillisecondsSinceEpoch(int.parse(element.orderDate))
//               .month
//               .toString() +
//           "/" +
//           DateTime.fromMillisecondsSinceEpoch(int.parse(element.orderDate))
//               .year
//               .toString(),
//       groupSeparatorBuilder: (String value) => Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Text(value,
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             )),
//       ),
//       itemBuilder: (context, dynamic element) =>
//           OrderTileModify(order: element),
//       // itemComparator: (item1, item2) =>
//       //     item1['name'].compareTo(item2['name']), // optional
//       // useStickyGroupSeparators: true, // optional
//       floatingHeader: true, // optional
//       order: GroupedListOrder.DESC, // optional
//     );
