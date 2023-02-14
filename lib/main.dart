import 'package:flutter/material.dart';
import 'package:prectice26/datamodel.dart';
import 'package:prectice26/datapage.dart';
import 'package:prectice26/homepage.dart';

List<StdModel> l1 = [
  ];

void main()
{
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => homepage(),
      'data': (context) => datapage(),
    },
  ));
}