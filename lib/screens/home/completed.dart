import 'package:afrikelist/screens/home/sorting/sortedOrder.dart';
import 'package:flutter/material.dart';

class Completed extends StatefulWidget {
  Completed({Key key}) : super(key: key);

  @override
  _CompletedState createState() => _CompletedState();
}

class _CompletedState extends State<Completed> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        // print(selectedDate);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Completed order"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 200.0,
            ),
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
              onPressed: () async {
                await _selectDate(context);
              },
              child: Text("Click here to pick a date"),
            ),
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SortedOrder(
                            isComplete: true,
                            selectedDate: selectedDate,
                          )),
                );
              },
              child: Text('Confirm date'),
            ),
          ],
        ),
      ),
    );
  }
}
