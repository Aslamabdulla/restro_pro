import 'package:flutter/material.dart';

Widget buildCounter(Function() fnctn, IconData icon) => GestureDetector(
      onTap: fnctn,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: const Color.fromRGBO(43, 154, 184, 1))),
        height: 30,
        width: 30.72,
        child: Center(
          child: Icon(icon),
        ),
      ),
    );
