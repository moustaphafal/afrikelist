import 'package:afrikelist/models/order.dart';
import 'package:afrikelist/shared/constants.dart';
import 'package:flutter/material.dart';

class ModifyForm extends StatefulWidget {
  final Order order;
  ModifyForm(this.order);

  @override
  _ModifyFormState createState() => _ModifyFormState(order);
}

class _ModifyFormState extends State<ModifyForm> {
  final Order order;
  _ModifyFormState(this.order);
  bool isShipped = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: <Widget>[
          SizedBox(height: 10.0),
          Row(
            children: <Widget>[
              SizedBox(
                width: 150,
                height: 40,
                child: TextField(
                  decoration: textInputDecoration.copyWith(hintText: ''),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              SizedBox(
                width: 148,
                height: 40,
                child: TextFormField(
                  initialValue: order.customerPhone,
                  decoration: textInputDecoration,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          //dropdown
          TextFormField(
            decoration: textInputDecoration,
            initialValue:
                'Order day: 23/01/2019 \n Description: card tricks pack',
            keyboardType: TextInputType.multiline,
            maxLines: 5,
          ),
          SizedBox(
            height: 10,
          ),
          Text('has is shipped to senegal'),
          Checkbox(
            value: isShipped,
            onChanged: (bool newValue) {
              setState(() {
                isShipped = !isShipped;
              });
            },
          ),
          RaisedButton(
            color: Colors.pink[400],
            child: Text(
              'Update',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
