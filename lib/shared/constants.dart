import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  hoverColor: Colors.grey,
  fillColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.blue,
      width: 2,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.redAccent, width: 2),
  ),
);
